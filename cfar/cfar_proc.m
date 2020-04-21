function threshold = cfar_proc(arr, detector)

    if(size(arr,1) < size(arr,2))
       arr = arr'; 
    end

    noise_half = detector.noise_half;
    guard_half = detector.guard_half;
    
    if(strcmp(detector.type, 'ca'))
        kernel = ones(1 + (2 * guard_half) + (2 * noise_half), 1) / (2 * noise_half);
        kernel(noise_half + 1:noise_half + (2 * guard_half) + 1) = 0;

        noise_floor = conv(arr, kernel, 'same');
        threshold = noise_floor * detector.t;

    elseif(strcmp(detector.type, 'cago'))
        [l_window, r_window] = cfar_window(arr, guard_half, noise_half);

        l_window = l_window / noise_half;
        r_window = r_window / noise_half;
        noise_floor = max(l_window, r_window);

        threshold = noise_floor * detector.t;

    elseif(strcmp(detector.type, 'caso'))
        [l_window, r_window] = cfar_window(arr, guard_half, noise_half);

        l_window = l_window / noise_half;
        r_window = r_window / noise_half;
        noise_floor = min(l_window, r_window);

        threshold = noise_floor * detector.t;

    elseif(strcmp(detector.type, 'os'))
        n = length(arr);
        noise_floor = zeros(n,1);
        threshold = zeros(n,1);

        cut_idx = 0;
        left_idx = (n - noise_half - guard_half):(n - guard_half-1);
        right_idx = 1+guard_half:(guard_half + noise_half);

        while(cut_idx < n)
            if(~mod(cut_idx-2,n+1))
                left_idx = [left_idx(2:end) mod(cut_idx-1, n+1)];
            else
                left_idx = [left_idx(2:end) mod(cut_idx-2, n+1)];
            end
            cut_idx = cut_idx + 1;
            if(cut_idx+guard_half+noise_half > n)
                right_idx = [right_idx(2:end) mod(cut_idx+guard_half+noise_half-n,n+1)];
            else
                right_idx = [right_idx(2:end) mod(cut_idx+guard_half+noise_half,n+1)];
            end
            window = [arr(left_idx); arr(right_idx)];
            window = sort(window);
            noise_floor(cut_idx) = window(detector.k);
            threshold(cut_idx) = noise_floor(cut_idx) * detector.t;
        end
    end

end