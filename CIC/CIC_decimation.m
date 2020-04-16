function result = CIC_decimation(signal, decimation_ratio)
    size = length(signal);
    if mod(size, decimation_ratio) ~= 0
        desize = floor(size/decimation_ratio) + 1;
    else
        desize = size/decimation_ratio;
    end


% Following is used for LLAP

    j = 1;
    i = decimation_ratio;
    while(i <= size)
       signal(j) = signal(i); 
       i = i + decimation_ratio;
       j = j + 1;
    end     
    result = signal(1:desize);
end