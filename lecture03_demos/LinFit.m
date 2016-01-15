%linear least squares for for simple 4 point data set
% (1,6) (2,5) (3,7) (4,10)
% evaluate beta = inv((z'*z))*z'*y

t = [1 2 3 4]';   %independent variable
y = [6 5 7 10]'; %dependent variable
Z = [1 1 1 1;    %matrix of inputs
       1 2 3 4]';

plot(t,y,'x');
xlabel('t'); ylabel('y'); 
axis([0 5 0 15]);
%literal execution of formula
beta = inv((Z'*Z))*Z'*y;
%more numerically stable way
%beta = (Z'*Z)\(Z'*y);
f = beta(1) + beta(2)*t;
hold on;
plot(t,f);