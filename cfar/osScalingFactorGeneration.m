function Ts = osScalingFactorGeneration(N, Pfa)
    k_arr = 1:N;
    Ts = NaN(N,1);
    for i = 1:N
        k = k_arr(i);
        syms T
        g=Pfa-k*nchoosek(N,k)*gamma(N-k+1+T)*gamma(k)/gamma(N+T+1);
        x=vpasolve(g, T);
        T=double(x);
%         Ts(i)=T(T==abs(T));
        Ts(i)=T;
    end
end