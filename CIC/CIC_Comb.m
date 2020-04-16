function result = CIC_Comb(signal, delay)
    temp = signal;
    size = length(signal);
    for i = 1:size
        if i > delay
            signal(i) = signal(i) - temp(i - delay);
        end
    end
    result = signal;
end