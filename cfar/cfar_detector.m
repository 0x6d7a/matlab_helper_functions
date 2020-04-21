function detector = cfar_detector(type, noise, guard, pfa)

    if(mod(noise,2) || mod(guard, 2))
       cprintf('err', 'Noise/Guard cells should be 2N\n');
       detector = [];
    else

        if(strcmp(type, 'ca'))

            alpha = noise * (power(pfa, -1 / noise) - 1);

        elseif(strcmp(type, 'cago'))
            syms T
            sum = 0;
            for k = 0:noise/2-1
                sum = sum + nchoosek(noise/2-1+k,k)*power((2 + T/(noise/2)), -k);
            end
            g = pfa/2 - power((1+T/(noise/2)),-noise/2) + sum * power((2 + T/(noise/2)), -noise/2);
            Ts=vpasolve(g, T);
            l = length(double(Ts));
            for i = 1:l
               if(isreal(double(Ts(i))) && double(Ts(i)) > 0)
                   alpha = double(Ts(i));
               end
            end
        elseif(strcmp(type, 'caso'))
            syms T
            sum = 0;
            for k = 0:N/2-1
                sum = sum + nchoosek(noise/2-1+k,k)*power((2 + T/(noise/2)), -k);
            end
            g = pfa/2 - sum * power((2 + T/(noise/2)), -noise/2);
            Ts=vpasolve(g, T);
            l = length(double(Ts));
            for i = 1:l
               if(isreal(double(Ts(i))) && double(Ts(i)) > 0)
                   alpha = double(Ts(i));
               end
            end

        elseif(strcmp(type, 'os'))
            
            detector.k = floor(4/5*noise);
            Ts = osScalingFactorGeneration(noise, pfa);
            alpha = double(Ts(detector.k));

        end


        detector.type = type;
        detector.t = alpha;
        detector.noise_half = noise / 2;
        detector.guard_half = guard / 2;
    
    end



end