M =load('shumway_datasets/cmort_series.txt');

%model 1
q = 2;
k=2;
n = numel(M);
t = ((1:n)*10/n);
plot(t,M);
xlabel('Year'); ylabel('Mortality'); 

Z = [ones(1,n);    %matrix of inputs
       t]';
t=t';
beta = (Z'*Z)\(Z'*M);
f = beta(1) + beta(2)*t;
hold on;
plot(t,f);
SSE= ((M-f)'*(M-f));  %sum of square errors
MSE = SSE/(n-q);     %unbiased mean of SE
SSE1 = (M-mean(M))'*(M-mean(M));
R2 = (SSE1 - SSE)/SSE1;
sigma2 = SSE/n;
AIC = log(sigma2) + (n+2*k)/n;
BIC = log(sigma2) + k*log(n)/n;

