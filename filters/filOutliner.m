function [output, idx] = filOutliner(arr, k, tri)
    lower = prctile(arr, 25);
    upper = prctile(arr, 75);
    iqr = upper - lower;
    
    uBound = upper + k * iqr;
    lBound = lower - k * iqr;
    
    if(strcmp(tri,'normal'))
        output = arr((arr <= uBound) .* (arr >= lBound) == 1);
        idx = intersect(find(arr <= uBound), find(arr >= lBound));
    else
        output = arr((arr <= uBound) .* (arr >= lBound) == 0);
        idx = [find(arr > uBound) find(arr < lBound)];
    end
end