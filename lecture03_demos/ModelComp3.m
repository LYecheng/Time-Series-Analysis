%compute coefficients for model 2.4 in Shumway
%to reproduce third line of table 2.2

M =load('shumway_datasets/cmort_series.txt');
T =load('shumway_datasets/tempr_series.txt');

T= T - mean(T);

%model 1
q = 4;
k=q;
n = numel(M);
t = ((1:n)*10/n)';
plot(t,M);
xlabel('Year'); ylabel('Mortality'); 

Z = [ones(1,n);    %matrix of inputs
       t';
       T';
       (T.^2)']';

beta = (Z'*Z)\(Z'*M);
f = beta(1) + beta(2)*t + beta(3)*T + beta(4)*T.^2;
hold on;
plot(t,f,'r');
SSE= ((M-f)'*(M-f));  %sum of square errors
MSE = SSE/(n-q);     %unbiased mean of SE
SSE1 = (M-mean(M))'*(M-mean(M));
R2 = (SSE1 - SSE)/SSE1;
sigma2 = SSE/n;
AIC = log(sigma2) + (n+2*k)/n;
BIC = log(sigma2) + k*log(n)/n;
