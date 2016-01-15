
clc;

n = 10000; % sample length
m = 100; % filter length

x = 1:1:n; % ARMA process
w = randn(n,1); % white noise
g = zeros(1,n);

% simulate ARMA
for n=3:1:n
    x(1)=0;
    x(2)=0;
    x(n)=0.2*x(n-1)-0.5*x(n-2)+0.5*w(n-1)+0.9*w(n-2)+w(n); % AR: 0.2, -0.5; MA: 0.5, 0.9
end

% generate filter
t = rand(m,1)*4-2;
for i=1:1:n
    if i<=m
        g(i)=-2*t(i)*exp(-power(t(i),2)/2);
    else
        g(i)=0;
    end
end

% filter x using convolution
x_conv = conv(x,g(1:m),'valid');

figure(1);
subplot(2,1,1);
plot(x); % plot of x
subplot(2,1,2);
plot(x_conv); % plot of filtered x

figure(2);
subplot(2,1,1);
plot(g(1:m)); % filter in physical space
subplot(2,1,2);
plot(fft(g)); % filter in fourier space
