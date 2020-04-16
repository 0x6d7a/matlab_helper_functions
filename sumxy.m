function output = sumxy(X)
    sumxy = 0;
    
    for i = 1:length(X)
       sumxy = sumxy + i * X(i);
    end

    output = sumxy;
end