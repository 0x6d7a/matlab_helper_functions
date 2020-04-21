function zcr_arr = calSlideZCR(arr, win, thr)

    [m, n] = size(arr);
    zcr_arr = zeros(m, n - win + 1);
    for j = 1:m
        for i = 1:n - win + 1
            zcr_arr(j, i) = zcr(arr(m, i:i + win - 1), thr);
        end
    end

end