function output = sumy2(arr)
    output = 0;
    for i = 1:length(arr)
        output = output + arr(i) * arr(i);
    end
end