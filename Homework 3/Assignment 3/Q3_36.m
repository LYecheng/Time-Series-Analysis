
clc;

model = arima('Constant',0,'AR',0.8,'Seasonality',12, 'MA',0.5,'Variance',1);
Y = simulate(model,100);

subplot(2,1,1);
plot(Y);
subplot(2,1,2);
autocorr(Y);

