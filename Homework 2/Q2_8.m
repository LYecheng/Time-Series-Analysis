clc;

y = dlmread('datasets/varve.txt');

y_log = log(y);
x = 1:1:634;
u = zeros;
plot(x,y,x,log(y));

fprintf('Variance of the first half is %.5f, second half is %.5f.\n',var(y(1:317)),var(y(318:634)));
fprintf('After stabilization, variance of the first half is %.5f, and the second half is %.5f.\n',var(log(y(1:317))),var(log(y(318:634)))); 

% hist(y,10); % histogram for question (b)
% hist(log(y),10);

% plot(x,rho);

acf = ones;
for i=2:634
    u(i) = log(y(i)) - log(y(i-1));
    if u(i-1)~=0
        acf(i) = u(i)/u(i-1);
    end 
end

fprintf('The mean of log(Xt)-log(Xt-1) is %.5f.\n', mean(u));
% plot(x,acf); % for (c)
% plot(x,u); % for (d)



