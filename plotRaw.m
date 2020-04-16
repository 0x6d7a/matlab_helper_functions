function plotRaw(arr, titles)
    [r, c] = size(arr);
    figure;
    for i = 1:r
        subplot(r, 1, i);
        plot(arr(i,:));
        if(nargin > 1)
            title(char(titles(i)));
        end
    end
end