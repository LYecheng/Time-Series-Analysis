clc;

m = dlmread('datasets/cmort_table.txt');
p = dlmread('datasets/part_table.txt');
t = dlmread('datasets/tempr_table.txt');

t_mean = 74.6;
size = 508;
time = 1;
M = zeros;
T = zeros;
Tt = zeros;
Z = zeros(6, size); % with the term Pt-4 added
Z2 = zeros(5, size); % without the term Pt-4 added

for i=1:508
    M(i) = m(i,3); % mortality
    T(i) = time; % time
    Tt(i) = t(i,3); % temperature
    
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

hold off;
plot(M,P,'o',M,P4,'x',M,T,'O'); % mortality VS particulate, particulate t-4, temperature
plot(T,P,'o',T,P4,'x',T,M,'O'); % temperature VS particulate, particulate t-4, mortality
plot(P,M,'o',P,T,'x'); % particulate VS mortality, temparature 
plot(P4,M,'o',P4,T,'x'); % particulate t-4 VS mortality, temparature 

fprintf('Correlation between M and P is %.5f.\n', corrcov(cov(M,P)));
fprintf('Correlation between M and Pt-4 is %.5f.\n', corrcov(cov(M,Pt-4)));
fprintf('Correlation between T and P is %.5f.\n', corrcov(cov(T,P)));
fprintf('Correlation between T and Pt-4 is %.5f.\n', corrcov(cov(T,Pt-4)));
fprintf('Correlation between M and T is %.5f.\n', corrcov(cov(M,T)));

if corrcov(cov(M,P)) > corrcov(cov(M,Pt-4))
    disp('The correlation between M and P is greater than the correlation between M and Pt-4.');
else
    disp('The correlation between M and P is less than the correlation between M and Pt-4.');
end
