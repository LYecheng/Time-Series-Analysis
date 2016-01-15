
clc;

n = 500;
repeat = 3;

w = rand(1,n);
x = zeros(3,n);
z = zeros(n,1);
theta = .9;

for i=1:repeat
    for j=2:n
        x(i,j) = 0.9*x(j-1) + w(j) - 0.9*w(j-1);
    end;
end;

figure;
subplot(2,1,1);
autocorr(x(1,:));
subplot(2,1,2);
parcorr(x(1,:));

for ite=1:20
    for i = 3:n
        z(i) = w(i-1)-theta*w(i-2)+theta*z(i-1);
    end
    theta_new = theta + (z'*w')/(z'*z);
    theta = theta_new;
end

error_variance = (w'*w)/(n-1);
