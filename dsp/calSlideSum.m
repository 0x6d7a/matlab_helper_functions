function output = calSlideSum(arr, window)
    N = window;
    l = length(arr);
    output = zeros(1, l);
    for i = N:l
        output(i) = sum(arr(i - N + 1:i));
    end
end