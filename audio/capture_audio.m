function y = capture_audio(fs, t)
    recorder = audiorecorder(fs,16,1, 0);
    recordblocking(recorder, t)
    y = getaudiodata(recorder);
end
