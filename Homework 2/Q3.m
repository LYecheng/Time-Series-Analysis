% Q3. Typical value is around 180

clc;

n = 10000;
lambda = 5;
a = zeros(1,n);

for i=1:n
    t = 0.0;
    x = 0;
    while (t < 1)
        dt = - log(rand(1)) / lambda;
        x = x + 1;
        t = t + dt;
    end
    a(i) = sum(20 * ones(1,x) + floor(21 * rand(1,x)));
end

arrival_of_fans = sum(a)/n;
fprintf('Simulated arrival of fans is %.2f.\n', arrival_of_fans);

y = 1:1:n;
plot(y,a);