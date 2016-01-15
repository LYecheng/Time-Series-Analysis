
clc;

no_observations = 50;
phi = 0.99;
sigma = 1;
Y = zeros(no_realization,1);
B = 200;

model = arima('Constant',0,'AR',phi,'Variance', sigma);
Y = simulate(model,no_observations);

plot(Y);