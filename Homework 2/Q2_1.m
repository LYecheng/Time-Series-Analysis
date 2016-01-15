
clc;

T = dlmread('datasets/jj_table.txt');
size = 21;

t = zeros;
x = zeros;
z = zeros(5,size); % without intercept term
z2 = zeros(6,size); % with intercept term
y = zeros;

for i=0:(size-1)
    for j=1:4
        index = i*4+j;
        
        t(index) = index;
        x(index) = T(i+1,j+1);
        
        z(1,index) = index;
        z(2,index) = 0;  % quarter 1
        z(3,index) = 0;  % quarter 2
        z(4,index) = 0;  % quarter 3
        z(5,index) = 0;  % quarter 4
        
        z2(1,index) = index;
        z2(2,index) = 1;
        z2(3,index) = 0;  % quarter 1
        z2(4,index) = 0;  % quarter 2
        z2(5,index) = 0;  % quarter 3
        z2(6,index) = 0;  % quarter 4
        
        if j==1
            z(2,index) = 1;
            z2(3,index) = 1;
        elseif j==2
            z(3,index) = 1;
            z2(4,index) = 1;
        elseif j==3
            z(4,index) = 1;
            z2(5,index) = 1;
        elseif j==4
            z(5,index) = 1;
            z2(6,index) = 1;
        end
    end
end

beta = inv((z*z'))*z*x';
y = beta'*z/4; 
plot(t,y,'x'); % plot of the model (without intercept term)
hold on;

beta2 = inv((z2*z2'))*z2*x';
y2 = beta'*z/4; 
plot(t,y2,'o'); % plot of the model (with intercept term)
hold on; 

plot(t,y,t,log(x)); % graph the data, with the fitted values superimposed
hold on;

residuals = log(x) - y;
plot(t,residuals);
hold on;
xlabel('Time (quarter)');
ylabel('Quanterly Earnings per Share & Residuals');



