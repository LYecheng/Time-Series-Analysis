%demonstrate that inverse method approximates
%pdf for p(x) = exp(-x) on [0,inf]
%cdf is thus P(x) = 1 - exp(-x)
%and 
% P^-1(x) = -log(1-U)

n=100000;
f = zeros(1,n);
for i=1:n
    U = rand;
    f(i) = -log(1-U);
end

[N,x] = hist(f,50);
dx = x(2)-x(1);
plot(x,N/(n*dx));
hold on;
plot(x,exp(-x),'o');
hold off;

