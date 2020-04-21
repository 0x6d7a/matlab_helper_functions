function ind = ij2ind(arr, i, j)
    [row, ~] = size(arr);
    ind = (j-1) * row + i;
end