hold off;
x=0:.001:1;
p = 3*x.^2;               %pdf we wish to sample from
g = ones(size(x));       %other pdf which we can
                                 %sample from
M = 3;                       %multiplier which ensures
                                 %g bounds p       
n = 1000000;
f = zeros(1,n);
for i = 1:n
    accepted = false;
    while ~accepted
        xc = rand;       %sample from known dist.
        alpha = xc^2;  %p(x)/(M*g(x))
        u = rand;        
        if (alpha >= u) 
            accepted = true;
            f(i) = xc;
        end
    end
end

[N,x] = hist(f,50);
dx = x(2) - x(1);
plot(x,N/(n*dx));
hold on;
plot(x,3*x.^2);
