clc;
clear all;
R=24;
n=R/2;
k=3*R/4;
Pfa=1e-6;
SNR_dB=5:1:30;
SNR=10.^(SNR_dB./10);
figure

syms T
g=Pfa-k*nchoosek(R,k)*gamma(R-k+1+T)*gamma(k)/gamma(R+T+1);
x=solve(g);
T=double(x);
T1=T(T==abs(T));


Pd_SO=k*nchoosek(R,k)*gamma(R-k+1+T1./(1+SNR))*gamma(k)./gamma(R+T1./(1+SNR)+1);
hold on
plot(SNR_dB,Pd_SO,'g');
grid on
