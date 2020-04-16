function xw = whitening(x)
    if(mean(x) > 1e-10)
       x = x - mean(x); 
    end
    
    xw = x / std(x);

end