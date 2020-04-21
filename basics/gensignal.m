function y = gensignal(varargin)

for i = 1:2:nargin
    if  strcmp(varargin{i}, 'Length'), sL = varargin{i+1};
    elseif  strcmp(varargin{i}, 'Samplerate'), fs = varargin{i+1};
    elseif  strcmp(varargin{i}, 'Frequencies'), freqs = varargin{i+1};
    elseif  strcmp(varargin{i}, 'Amplitudes'), amps = varargin{i+1};
    elseif strcmp(varargin{i}, 'NoiseSNR'), snr = varargin{i+1};
    else
        error('Invalid argument');
    end
end

t = linspace(0, sL/fs, sL);
signal = zeros(1, sL);

numOfsignals = length(freqs);
for i = 1:numOfsignals
    signal = signal + amps(i) * cos(2*pi*freqs(i)*t);
end

if(snr == 0)
    y = signal';
else
    y = awgn(signal, snr)';
end

end