function output = flatness(X)
    XLog    = log(X+1e-20);
    output  = exp(mean(XLog)) ./ (mean(X));
   
    % avoid NaN for silence frames
    output (sum(X) == 0) = 0;

end