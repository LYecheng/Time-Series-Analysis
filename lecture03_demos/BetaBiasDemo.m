%generate a linear process with uncorrelated 
%gaussian noise and directly observed statistics
%of lsf regression coefficients

n = 200;             % number of observations in sample
m = 100000;            % number of samples
B1 = 1; B2 = 2;   % true values of regression coeffs
                          %normally this is never know
t = (1:n)'/n*10;    %independent variable is time

bdist = zeros(2,m); % stores values of be from each sample

for i=1:m               % for each sample
    w = randn(n,1);  % generated guassion noise
    y = B1 + B2*t + w; %create synthetic dataset
 
    %now we solve normal equations for b's
    Z = [ones(1,n);    
           t']';
    b = (Z'*Z)\(Z'*y);   %sample estimates of B
    
    bdist(:,i) = b;        %store in list of samples
end
Eb = mean(bdist,2);  %expected value of b
va = var(bdist');        %  variance only
co = cov(bdist');       % full covariance of b
[N x] = hist(bdist(1,:),50); % distribution
plot(x,N);
%plot(t,y,'o');

%note formula 2.9 in Shumway. If we know or
%can estimate cov of w, we can calculate var(b)
%as var*inv((Z'*Z))
%here true var(w) is one
inv((Z'*Z))

