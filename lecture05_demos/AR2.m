phi = .1;
%phi = -.9;
n = 10000;

w = randn(1,n);
x = zeros(1,n);

for t=1:n
    for j=0:t-1
        x(t) = x(t) + phi^(j)*w(t-j);
    end
end
plot(x);


ACF = acf(x',20);
plot(ACF);
hold on;
lag=2:22;
plot(phi.^(lag),'r'); 