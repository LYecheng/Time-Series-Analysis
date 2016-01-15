% Q4

clc;

x=0:.001:1;
p = 3*x.^2;  
iteration_g = zeros; % g(x) = 1
iteration_h = zeros; % h(x) = 2*x

n = 100000;
f1 = zeros(1,n);
f2 = zeros(1,n);

disp('Running h(x) = 2x ...');
tic
for i = 1:n
    count = 0;
    accepted = false;
    while ~accepted
        xc = rand^(1/2); 
        alpha = xc; 
        u = rand;   
        count = count + 1;
        if (alpha >= u) 
            accepted = true;
            f1(i) = xc;
        end
    end
    iteration_h(i) = count;
end
toc
fprintf('variance of h(x) is %.5f, expected number of iterations is %.2f.\n\n', var(f1), mean(iteration_h)); 

disp('Running g(x) = 1 ...');
tic
for i = 1:n
    count = 0;
    accepted = false;
    while ~accepted
        xc = rand;      
        alpha = xc^2;  
        u = rand; 
        count = count + 1;
        if (alpha >= u) 
            accepted = true;
            f2(i) = xc;
        end
    end
    iteration_g(i) = count;
end
toc
fprintf('variance of g(x) is %.5f, expected number of iterations is %.2f.\n', var(f2), mean(iteration_g));

hold off;
[N,x] = hist(f1,50);
dx = x(2) - x(1);
plot(x,N/(n*dx),'o');
hold on;
[N,x] = hist(f2,50);
dx = x(2) - x(1);
plot(x,N/(n*dx),'x');
hold on;
plot(x,3*x.^2);