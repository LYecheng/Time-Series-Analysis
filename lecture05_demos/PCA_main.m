%create two correlated variables with corr=p;
m = 2; n = 10000;
s1 = 1; s2 = 1; p = .9; m1 = 0; m2 = 0;
u = randn(1,n);
v = randn(1,n);

x = s1*u+m1;
y = s2*(p*u+sqrt(1-p^2)*v)+m2;

%create data matrix X
X = [x;y];
plot(x,y,'.');

%do PCA
[Y PC V] = PCA1(X);

%plot new axes
arrow(zeros(m), PC);

%print variance
fprintf(1, 'variance:%f\n', V);