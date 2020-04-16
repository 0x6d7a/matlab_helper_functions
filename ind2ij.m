function rc = ind2ij(arr,ind)

    [row, ~] = size(arr);
    
    l = length(ind);
    
    rc = zeros(l, 2);
    
    for i = 1:l
        
        if(mod(ind(i), row) == 0)
            r = row;
            c = ind(i) / row;
        else
            r = mod(ind(i), row);
            c = ceil(ind(i)/row);
        end
        
        rc(i,:) = [r c];

    end
end