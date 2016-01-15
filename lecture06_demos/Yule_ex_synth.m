%example 3.26 from shumway

n = 146;            %n-2 values of x(t)
x = zeros(n,1);   %storage for time series
w = randn(n,1);  %iid(0,1) error term 

% create the n-2 point ARMA(2) process
for i=3:n
    x(i) = 1.5*x(i-1) -.75*x(i-2) + w(i);
end
%ignore first two values
x=x(3:end);
% get acf lags 1 and 2 and lag 0 (variance)
ac = acf(x,2);
ac0 = var(x);  %lag 0 term
ac1 = ac(1);   %lag 1 term
ac2 = ac(2);   %lag 2 term
Gamma = [1 ac1; ac1 1]; %Y-W matrix for autocorr
gamma = [ac1 ac2];        %rhs for Y-W
phi = inv(Gamma)*gamma';
disp(phi);
sigma2_w = ac0*(1-[ac1 ac2]*phi);
plot(x);