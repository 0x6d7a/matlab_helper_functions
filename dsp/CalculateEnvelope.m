function [expAvg, avgEng] = CalculateEnvelope(sample, avg, w_dc, avg_env, w_env)
	[expAvg, baseSample] = RemoveDC(sample, avg, w_dc);
    pos_sample = abs(baseSample);
    avgEng = w_env*pos_sample + (1-w_env)*avg_env;
end