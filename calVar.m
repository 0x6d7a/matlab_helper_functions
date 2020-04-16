function output = calVar(arr, window)
    N = window;
    l = length(arr);
    output = zeros(1, l);
    for i = 1:l
        if(mod(N,2) ~= 0)
            if(i > l - (N-1)/2)
                output(i) = var([arr(1,i - (N-1)/2 : l) zeros(1, i + (N-1)/2 - l)]);
            elseif(i > (N-1)/2)
                output(i) = var(arr(1,i - (N-1)/2 : i + (N-1)/2));
            else
                output(i) = var([zeros(1, (N-1)/2 - i + 1) arr(1, 1 : i + (N-1)/2)]);
            end
        else
            if(i > l - N/2)
                output(i) = var([arr(1, i - N/2 : l) zeros(1, i + N/2 - l - 1)]); 
            elseif(i > N/2)
                output(i) = var(arr(1, i - N/2 : i + N/2 - 1 )); 
            else
                output(i) = var([zeros(1, N/2 - i + 1) arr(1, 1 : i + N/2 - 1)]); 
            end
        end
    end

end