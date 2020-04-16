function [expAvg, base] = RemoveDC(sample, avg, w)
    expAvg = w*sample + (1-w)*avg;
    base = sample -  expAvg;
end