function c = centroid(X)
    sumxy = 0;
    sumy = 0;
    
    for i = 1:length(X)
       sumxy = sumxy + i * X(i) * X(i);
       sumy = sumy + X(i) * X(i);
    end
    
    c = floor(sumxy / sumy);

end