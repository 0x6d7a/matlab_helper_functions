function output = sumxy2(X)
    sumxy = 0;
    
    for i = 1:length(X)
       sumxy = sumxy + i * X(i) * X(i);
    end

    output = sumxy;
end