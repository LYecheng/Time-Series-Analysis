clc;

m = dlmread('datasets/cmort_table.txt');
p = dlmread('datasets/part_table.txt');
t = dlmread('datasets/tempr_table.txt');

t_mean = 74.6;
size = 508;
time = 1;
M = zeros;
T = zeros;
Z = zeros(6, size); % with the term Pt-4 added
Z2 = zeros(5, size); % without the term Pt-4 added

for i=1:508
    M(i) = m(i,3);
    T(i) = time;
    
    Z(1,i) = 1;
    Z(2,i) = time;
    Z(3,i) = t(i,3) - t_mean;
    Z(4,i) = (t(i,3) - t_mean)^2;
    Z(5,i) = p(i,3);
    
    Z2(1,i) = 1;
    Z2(2,i) = time;
    Z2(3,i) = t(i,3) - t_mean;
    Z2(4,i) = (t(i,3) - t_mean)^2;
    Z2(5,i) = p(i,3);
    
    if i > 4
        Z(6,i) = p(i-4,3);
    end
    time = time + 1;
end

P = Z(5,:);
P4 = Z(6,:);

beta = inv((Z*Z'))*Z*M';
y = beta'*Z;
beta2 = inv((Z2*Z2'))*Z2*M';
y2 = beta2'*Z2;

hold off;
plot(T,M,T,y,'x',T,y2,'o');
hold on;
plot(T, y-M, T, y2-M);
hold on;

fprintf('Before adding Pt-4 to the model, average residual is %f.\nAfter adding Pt-4 to the model, average residual is %f.',mean(y2-M),mean(y-M));
