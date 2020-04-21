function plotFFT(x, fs, N)
figure;
subplot(2,1,1); 
plot(x); 
subplot(2,1,2); 
win = hanning(length(x));
X = abs(fft(win.*x, N))/sum(win);

% Plot full spectrum
% plot(linspace(-fs/2, fs/2, N), fftshift(abs(fft(x, N))));

% Plot positive spectrum
plot(linspace(0, fs/2, N/2), X(1:N/2));

end