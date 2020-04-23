close all; clear; clc;

rate = 48000;
recObj = audiorecorder(rate, 16, 1);
disp('Start speaking.')
recordblocking(recObj, 3);
disp('End of Recording.');

% Play back the recording.
% play(recObj);

% Store data in double-precision array.
myRecording = getaudiodata(recObj);

% Plot the waveform.
plot(myRecording);

t = 1:2*pi/(rate - 1):2*pi;
freq = 17.5e3;

ref = cos(freq * t);
chunk = 1024;

myRecording = myRecording';
size = 3;
R = 16;
N = 4;
M = 17;
x = zeros(size, chunk);
y = zeros(size, chunk/R);
f = cicdesign(R, N, M);
for i = 1:size
    x(i,:) = myRecording(1 + (i-1)*chunk:i*chunk) .* ref(1 + (i-1)*chunk:i*chunk);
    y(i,:) = cicfilter(f, x(i,:));
end
sig = y(:);
plot(sig/(R*M)^N);
