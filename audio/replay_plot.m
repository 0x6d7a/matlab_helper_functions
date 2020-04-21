function replay_plot(y, Fs, Nfft, chunkSize)

    if nargin < 3, Nfft = 2048; end   %threshold value for peak detection
    
    if nargin < 2, Fs = 48e3; end

    recSize = chunkSize;
    fftSize = Nfft;

    i = 1;
    x = linspace(0, Fs/2, fftSize/2);
    h = figure();
    subplot(2,1,1);
    plotHandler = plot(x,  zeros(1, fftSize / 2));
    ylim([0 120]);
    hold on; 

    subplot(2,1,2);
    plotHandler_pcm = plot(zeros(1, recSize));
%     ylim([-0.3 0.4]);

    target_data_pre = zeros(1, fftSize / 2);
    lambda = 0;
    win = hanning(fftSize);

    while(i < length(y) - recSize + 1)
            data = y(i: i + recSize - 1)';
            frame_data = win' .* data;
            f_data = fft(frame_data, fftSize);
            f_data_mg = abs(f_data(1:fftSize / 2));
            target_data = f_data_mg;
            target_data = (1 - lambda) * target_data + lambda * target_data_pre;
            target_data_pre = target_data;

            set(plotHandler, 'YData',20*log10(target_data));
            set(plotHandler_pcm, 'YData', data);
            
            title(strcat('Frame: ', num2str(i)));
            drawnow limitrate;
%             pause(0.1);
            i = i + 1;

    end
    
end