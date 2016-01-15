
clc;

T = dlmread('datasets/unemp_series.txt'); % use T(i, j) to access
disp(T); % 12 months

% plot ACF and PACF of the original data 
subplot(2,1,1);
autocorr(T);
subplot(2,1,2);
parcorr(T);

% get the difference
TT = zeros(362,1);
for i=2:372
    TT(i)=T(i)-T(i-1);
end;
figure(2);
subplot(2,1,1);
autocorr(TT);
subplot(2,1,2);
parcorr(TT);

% choose model ARIMA(2,1,0)X(0,1,1)_12


