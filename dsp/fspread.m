% Moment 2 = spectral spread
function [spread, c] = fspread(X)
    c = centroid(X);
    sumxy = 0;
    sumy = 0;
    for i = 1:length(X)
       sumxy = sumxy + (i - c)^2 * X(i) * X(i);
       sumy = sumy + X(i) * X(i);
    end
    
    spread = sqrt(sumxy / sumy);

end