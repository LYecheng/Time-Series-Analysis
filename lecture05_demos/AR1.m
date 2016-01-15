n = 500;
w = randn(1,n);

x = zeros(1,n);

for i = 3:n
    x(i) = x(i-1) - .90*x(i-2) + w(i);
end;

plot(x);