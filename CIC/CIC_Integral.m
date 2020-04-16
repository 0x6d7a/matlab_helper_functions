function result = CIC_Integral(signal)
    size = length(signal);
    for i = 2:size
        signal(i) = signal(i) + signal(i - 1);
    end
    result = signal;
end