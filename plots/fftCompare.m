function fftCompare(varargin)
    if nargin < 3
       cprintf('err', 'Not enough arguments');
    end
    fs = varargin{1};
    fftSize = varargin{2};
    fftbin = fs/fftSize;
    winL = length(varargin{3});
    win = hanning(winL);
    j = 0;
    for i = 3:nargin
        subplot(nargin-2, 2, i - 2 + j);
        Y = fft(win .* varargin{i}, fftSize) / sum(win);
        AY = abs(Y(1:fftSize/2));
        [pl, pv] = peakfinder(AY);
        pl = floor(pl * fftbin);
        plot(linspace(0, fs/2, fftSize/2), AY);
        hold on; 
        plot(pl, pv, 'or');
        labelpoints(pl, pv, num2str(round(pv*100)/100));
        
        subplot(nargin-2, 2, i - 1 + j);
        plot(varargin{i});
        
        j = j + 1;
    end
end