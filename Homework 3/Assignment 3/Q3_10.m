
clc;

T = dlmread('datasets/cmort_table.txt'); 

%%%%%%%%%%%%%%%%%% Part(a) %%%%%%%%%%%%%%%%%%
z = zeros(2, 506);
x = zeros(1,506);
f = zeros(1,506);
t = 1:1:506;
var = 0;

% construct matrix Z and X
for i=1:506
    x(1,i) = T(i,3);
    z(1,i) = T(i+1,3);
    z(2,i) = T(i+2,3);
end;


hold off;
plot(t,x); % plot original dataset
hold on;

phi = inv((z*z'))*z*x'; % linear regression
for i=1:506
    f(1,i)=phi(1)*z(1,i)+phi(2)*z(2,i);
     var = var + (f(1,i)-x(1,i))^2
end;

var = var/506;

disp(var);

plot(t,f); % plot fitted data 
hold on; 
disp(phi);

test = x(3)-0.4926*x(2)-0.5064*x(1);
disp(test);

%%%%%%%%%%%%%%%%%% Part(b) %%%%%%%%%%%%%%%%%%

xp = zeros(1,4);

#  the below part has some issue, please see the R code instead
xp(1,1) = phi(1)*x(506) + phi(2)*x(505);
interval1 = 1.96*sqrt(var); 
fprintf('The range is %f +/- %f\n', xp(1,1),interval1);
xp(1,2) = phi(1)*xp(1) + phi(2)*x(506);
interval2 = 1.96*sqrt(var*(1+phi(1)^2)); 
fprintf('The range is %f +/- %f\n', xp(1,2),interval2);
xp(1,3) = phi(1)*xp(2) + phi(2)*xp(2);
interval3 = 1.96*sqrt(var*(1+phi(1)^2+(phi(1)^2-phi(2))^2)); 
fprintf('The range is %f +/- %f\n', xp(1,3),interval3);
xp(1,4) = phi(1)*xp(3) + phi(2)*xp(2);
interval4 = 1.96*sqrt(var*(1+phi(1)^2+(phi(1)^2-phi(2))^2)+(1+phi(1)^2-phi(2))^3); 
fprintf('The range is %f +/- %f\n', xp(1,4),interval4);

% hold off;
tt = 507:1:510;
plot(tt, xp, 'g');
hold on;



