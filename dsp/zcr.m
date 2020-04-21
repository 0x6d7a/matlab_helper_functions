function y = zcr(x,thr)
%     x = x - mean(x);
    y = sum(abs(diff(x>thr)))/length(x);

end