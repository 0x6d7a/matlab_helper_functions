function output = rmdc(arr, w, tri)

    avg = arr(1);
    temp  = zeros(2, length(arr) - 1);
    for i = 2:length(arr)
        [expAvg, base] = RemoveDC(arr(i), avg, w);
        temp(1, i - 1) = expAvg;
        temp(2, i - 1) = base;
        avg = expAvg;
    end
    
    if (nargin < 3)
        output = temp(2, :); % Output Base
    elseif(strcmp(tri, 'avg'))
        output = temp(1, :); % Output Avg
    end
end