function m = moment(X, num)

    c = centroild(X);
    sumxy = 0;
    sumy = 0;
    for i = 1:length(X)
       sumxy = sumxy + (i - c)^num * X(i);
       sumy = sumy + X(i);
    end

    m = sumxy / sumy;
end