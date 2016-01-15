x = load('varve.txt');
%transfor data to fit model specification
xx = log(x./circshift(x,1));
xx(1) = 0;

%initial guess B_0 is just theta
theta = -.1
n = numel(xx);
%w is the array of n errors
w = zeros(n,1);
%z is the array of n-1 derivatives
z = zeros(n,1);

% out loop is number of G-N iterations
for iter=1:12
% xx is data, so w(i) is error against MA(1) model
    for i=2:n
        w(i) = xx(i) - theta*w(i-1);
    end
    % calculate array of derivatives
    for i=2:n
        z(i) = w(i-1)- theta*z(i-1);
    end
    
    theta_new = theta + (z'*w)/(z'*z);
    theta = theta_new
end

%estimate of error variance
(w'*w)/(n-1);