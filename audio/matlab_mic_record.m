function [sampleData] =  matlab_mic_record
    sampleData = {};
    atSample = 1;
    atPeriod = 1;
    fs       = 48e3;
    timerPer = 0.04;
    fftSize  = 2048;
    x        = 1:fftSize / 2;
    sampleSize = floor(fs*timerPer);
    time_rec = 5; % total time for recording
    recObj = audiorecorder(fs,16,1); % create rec object
    plotHandler = plot(floor(fs / fftSize * x),  zeros(1, fftSize / 2));
    set(recObj,'TimerPeriod',timerPer,'TimerFcn',{@recorderCallback, recObj, plotHandler}); 
    recordblocking(recObj,time_rec);
    function recorderCallback(obj, event, rcdObj, plotHandler)
        samples = getaudiodata(rcdObj);
        sampleData{atPeriod} = samples(atSample:sampleSize+atSample-1);
        f_data = fft(sampleData{atPeriod}, fftSize);
        f_data_mg = abs(f_data(1:fftSize / 2));
        set(plotHandler, 'YData',f_data_mg);
        title(strcat('Frame: ', num2str(atPeriod)));
        drawnow limitrate;
        atPeriod = atPeriod + 1;
        atSample = atSample + sampleSize;
    end
 end