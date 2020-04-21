function output = medianFilter(arr, window)

        s = size(arr);
        
        if(s(1) > s(2))
            tmp = arr';
        else
            tmp = arr;
        end
        output = zeros(s);
        N = window;
        l = length(tmp);
        for i=N:l
            output(i) = median(tmp(1,i-N+1:i));
        end
end

% reference medfilt1
% When n is odd, y(k) is the median of x(k-(n-1)/2:k+(n-1)/2).
% When n is even, y(k) is the median of x(k-n/2:k+(n/2)-1). In this case, medfilt1 sorts the numbers and takes the average of the two middle elements of the sorted list.