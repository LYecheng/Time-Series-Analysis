
clc;

T = dlmread('datasets/cmort_table.txt');

%%%%%%%%%%%%%%%%%% using linear expression %%%%%%%%%%%%%%%%%%

z = zeros(2, 506);
x = zeros(1,506);
f = zeros(1,506);
y = zeros(1,506);

t = 1:1:506;
mean = 0;
var1 = 0;
var2 = 0;

% construct matrix Z and X
for i=1:506
    x(1,i) = T(i,3);
    z(1,i) = T(i+1,3);
    z(2,i) = T(i+2,3);
    mean = mean + x(1,i);
end;
mean = mean/506;

phi = inv((z*z'))*z*x'; % linear regression
for i=1:506
    f(1,i)=phi(1)*z(1,i)+phi(2)*z(2,i);
    var1 = var1 + (f(1,i)-x(1,i))^2;
end;



hold off;
plot(t,x); % plot original dataset
hold on;
plot(t,f); % plot fitted data 
hold on;

%%%%%%%%%%%%%%%%%% using yulo-walker %%%%%%%%%%%%%%%%%%

yw = aryule(x,2);

for i=1:506
    y(1,i)=-yw(2)*z(1,i)-yw(3)*z(2,i);
    var2 = var2 + (y(1,i)-x(1,i))^2;
end

figure(2);
hold off;
plot(t,x); % plot original dataset
hold on;
plot(t,y); % plot fitted data 
hold on;

fprintf('variance using linear regression is %f\n',var1/506);
fprintf('variance using yule-walker is %f\n',var2/506);
if var1<var2
    disp('linear regression is lightly more accurate');
else
    disp('yule walker is slightly more accurate');
end;

