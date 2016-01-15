%linear least squares fit to Shumway temperature
%data
y =load('shumway_datasets/gtemp.txt');
n = numel(y);
t = (1:n)';
Z = [ones(1,n);    %matrix of inputs
       1:n]';

plot(t,y,'x');
xlabel('time'); ylabel('temp'); 
axis([-10 140 -1 1]);
%literal execution of formula
%beta = inv((Z'*Z))*Z'*y;
%more numerically stable way
beta = (Z'*Z)\(Z'*y);
f = beta(1) + beta(2)*t;
hold on;
plot(t,f);
