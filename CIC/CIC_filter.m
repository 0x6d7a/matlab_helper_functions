function result = CIC_filter(signal, sections, decimation_ration, differential_delay)
    for i = 1:sections
        signal = CIC_Integral(signal);
    end
    
    result = CIC_decimation(signal, decimation_ration);
    
    for i = 1:sections
        result = CIC_Comb(result, differential_delay);
    end

    result = result / power(decimation_ration * differential_delay, sections);
%     result = result / power(decimation_ration, sections - 1);
end