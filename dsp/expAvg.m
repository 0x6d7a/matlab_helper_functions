function output = expAvg(sample, avg, weight)
    avg = weight * sample + (1 - weight) * avg;
    output = avg;
end