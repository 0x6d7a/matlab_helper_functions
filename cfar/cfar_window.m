function [l_window, r_window] = cfar_window(arr, guard_half, noise_half)

    r_kernel = zeros(1 + (2 * guard_half) + (2 * noise_half), 1);
    r_kernel(1:noise_half) = 1;
    l_kernel = flipud(r_kernel);

    l_window = conv(arr, l_kernel, 'same');
    r_window = conv(arr, r_kernel, 'same');
    
end