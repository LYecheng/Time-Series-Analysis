x = load('rec_series.txt');
x = x-mean(x);
n = numel(x);

%autocorrelation at lags 0,1,2
ac = acf(x,2);
ac0 = var(x);
ac1 = ac(1);
ac2 = ac(2);

% Y-W matrix
Gamma = [1 ac1; ac1 1];
%rh s
gamma = [ac1 ac2];
%solve system
phi = inv(Gamma)*gamma';
disp(phi)
sigma2_w = ac0*(1-[ac1 ac2]*phi);
disp(sigma2_w);
plot(x);