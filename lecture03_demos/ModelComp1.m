%compute coefficients for model 2.2 in Shumway
%to reproduce first line of table 2.2

%load mortality data
M =load('shumway_datasets/cmort_series.txt');

%model 1
q = 2;                %number of terms in regression
k=2;                  
n = numel(M);    
t = ((1:n)*10/n)'; %time sample points
%show data
plot(t,M);
xlabel('Year'); ylabel('Mortality'); 

%create regression matrix
Z = [ones(1,n);    %matrix of inputs
       t']';

%solve for betas
beta = (Z'*Z)\(Z'*M);
%create fit line
f = beta(1) + beta(2)*t;
hold on;
%plot fit line
plot(t,f);

SSE= ((M-f)'*(M-f));  %sum of square errors
MSE = SSE/(n-q);     %unbiased mean of SE

SSE1 = (M-mean(M))'*(M-mean(M));
R2 = (SSE1 - SSE)/SSE1;
sigma2 = SSE/n;
AIC = log(sigma2) + (n+2*k)/n;
BIC = log(sigma2) + k*log(n)/n;

