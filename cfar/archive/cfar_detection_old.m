function [idx, thrs] = cfar_detection_old(arr, num_train, num_guard, rate_fa)
    
    idx = [];
    thrs = NaN(length(arr),1);
    num_cell = length(arr);
    num_train_half = round(num_train / 2);
    num_guard_half = round(num_guard / 2);
    num_side = num_train_half + num_guard_half;

    alpha = power(rate_fa, -1 / num_train) - 1;
 
    for i = num_side:num_cell - num_side
%         [~, argmax] = max(arr(i - num_side + 1:i + num_side));
%         if(i ~= i - num_side + argmax)
%             continue;
%         end
        
        sum1 = sum(arr(i - num_side + 1:i + num_side));
        sum2 = sum(arr(i - num_guard + 1:i + num_guard));
        
        p_noise = (sum1 - sum2);
        thr = p_noise * alpha;
        thrs(i) = thr;
        if(arr(i) >= thr)
            idx = [idx i];
        end     
    end
    
end