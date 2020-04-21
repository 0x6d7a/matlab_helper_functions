function output = impulseRemoval(arr, window)
    output = arr;
    N = window;
    l = length(arr);
    for i = N:l
        samples = arr(i-N+1: i);
        miu = mean(samples);
        pos = 0;
        neg = 0;
        diff = 0;
        for j = 1:N
            if(samples(j) > miu)
                pos = pos + 1;
                diff = diff + samples(j) - miu;
            end

            if(samples(j) < miu)
                neg = neg + 1;
            end
        end
        output(i) = miu + (pos - neg) * diff / N^2;
    end
end