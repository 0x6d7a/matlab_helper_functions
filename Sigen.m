close all; clear; clc;
%% Signal generation

fs = 48e3;
bufferSize = 1000000;
deltFreq = 150;
numFreq = 1;
startFreq = 22e3;
cosBuffer = zeros(numFreq, bufferSize);
sinBuffer = zeros(numFreq, bufferSize);
x = 0:bufferSize-1;


soundspeed = 343000;
wavelength = soundspeed / startFreq;
recSize = 480;
deltaT = fs / recSize;

moving_freq = 0.5;
dt = abs((sin(2 * pi * moving_freq * x /fs))) * 200;
receive_sig = cos(2 * pi * startFreq * (x /fs - dt / 343000));

dt_chgs = zeros(1, floor(length(dt) / recSize));
for k = 1:length(dt_chgs)
    dt_chgs(k) = (dt(k*recSize) - dt((k - 1)*recSize + 1)) / 2;
end

for i=0:numFreq-1
    cosBuffer(i+1,:) = cos(2 * pi * (startFreq + i * deltFreq) * x /fs);
    sinBuffer(i+1,:) = -sin(2 * pi * (startFreq + i * deltFreq) * x /fs);
end

% Combine the data into output buffer
outBuffer = sum(cosBuffer, 1)/numFreq;

%% FFT
fftSize = 4096;
fftBuffer = abs(fft(outBuffer, fftSize));
plot([0:fftSize/2-1] * fs / fftSize, fftBuffer(1:fftSize / 2));



