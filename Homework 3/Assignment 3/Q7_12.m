
clc;

heatT = dlmread('datasets/fmri.Awake_Heat.txt'); 
shockT = dlmread('datasets/fmri.Awake_Shock.txt');
[n,~] = size(heatT);

% 1. heat
heat = zeros(9,n);
for i = 1:9
    for j = 1:n
        heat(i,j) = heatT(j,i+1);
    end;
end;

mn = mean(heat,2);
heat = heat - repmat(mn, 1, n); % substract mean
covariance = 1/(n-1) * (heat * heat'); % get covariance matrix
[PC, Vh] = eig(covariance); % get eigenvectors and eigenvalues
Vh = diag(Vh); % extract eigenvalues from diagonal
[~, rindices] = sort(-1*Vh);
Vh = Vh(rindices); % sort the variances in decreasing order (most significant to least)
PC = PC(:,rindices); 
Y = PC' * heat;% project the original data set

disp('Variances of fmri Heat (decreasing order): ');
disp(Vh');

heat_measurement = 1; % for demonstration purpose, can be any integer from 1 to 9
plot(heat(heat_measurement,:));
hold on;
plot(Y(heat_measurement,:));
hold on;


% 2. shock
shock = zeros(9,n);
for i = 1:9
    for j = 1:n
        shock(i,j) = shockT(j,i+1);
    end;
end;

mn = mean(shock,2);
shock = shock - repmat(mn, 1, n); % substract mean
covariance = 1/(n-1) * (shock * shock'); % get covariance matrix
[PCs, Vs] = eig(covariance); % get eigenvectors and eigenvalues
Vs = diag(Vs); % extract eigenvalues from diagonal
[~, rindices] = sort(-1*Vs);
Vs = Vs(rindices); % sort the variances in decreasing order (most significant to least)
PCs = PCs(:,rindices); 
Ys = PCs' * shock; % project the original data set

disp('Variances of fmri Shock (decreasing order): ');
disp(Vs');

figure(2);
shock_measurement = 3;  % for demonstration purpose, can be any integer from 1 to 9
plot(shock(shock_measurement,:));
hold on;
plot(Ys(shock_measurement,:));
hold on;

