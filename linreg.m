function [b, m] = linreg(y, size)
    sumxy = 0;
    sumy = 0;
    sumx = 0;
    sumx2 = 0;
    sumy2 = 0;
    
    for i = 0:size-1
       sumx = sumx + i;
       sumx2 = sumx2 + i * i;
       sumxy = sumxy + i * y(i+1);
       sumy = sumy + y(i+1);
       sumy2 = sumy2 + y(i+1) * y(i+1);
    end
    
    denom = size * sumx2 - sumx * sumx;
    if(denom == 0)
       b = 0;
       m = 0;
    end
    
    m = (size * sumxy - sumx * sumy) / denom;
    b = (sumy * sumx2 - sumx * sumxy) / denom;

end