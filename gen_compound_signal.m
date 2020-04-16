clear;
close all;
fs = 48000;
t = 0:1/fs:0.01;
x1 = cos(2*pi*23000*t);
x2 = cos(2*pi*24000*t);
x3 = cos(2*pi*25000*t);
x4 = cos(2*pi*26000*t);
w(1,:) = x1 + x2 + x3 + x4;
w(2,:) = [x1(5:end) x1(1:4)] + [x2(5:end) x2(1:4)] + [x3(5:end) x3(1:4)] + [x4(5:end) x4(1:4)];
% w = x1;
plot(w(1:10000));
xlabel('Time (sec)')
ylabel('Amplitude') 
title('Compound Periodic Wave');
