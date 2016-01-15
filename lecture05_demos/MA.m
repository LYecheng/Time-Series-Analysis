hold off;
n = 10000;
w = randn(1,n);
x = zeros(1,n);
theta = .5;

for t=2:n
    x(t) = w(t) + theta*w(t-1);
end

ACF = acf(x',10);
fprintf(1,'Computed ACF:%f\n', ACF);
fprintf(1,'theoretical ACF(1):%f\n',theta/(1+theta^2));
plot(x,'x');
