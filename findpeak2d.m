function [lr, lc] = findpeak2d(arr, thr)
    n_resp = arr - max(arr(:));
    background = (n_resp < thr) * -120;
    idx_list = find(background(:) == 0);
    lr = [];
    lc = [];
    for i = 1:length(idx_list)
        [r,c] = ind2ij(arr, idx_list(i));
        if(arr(r,c) > arr(r, c - 1) && arr(r,c) > arr(r, c + 1) && ...
                arr(r, c) > arr(r - 1, c) && arr(r, c) > arr(r + 1, c))
            lr = [lr r];
            lc = [lc c];
        end
    end
end