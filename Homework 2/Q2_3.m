function Q2_3
    clc;

    repeat = 6;
    result = zeros(repeat,100);
    beta = zeros(repeat,2);
    t = zeros;
    z = zeros(2,100);
    for i=1:100
        t(i) = i;
        z(1,i) = 1;
        z(2,i) = i;
    end
    
    hold off;
    for i=1:repeat
        x = random_walk;
        result(i,:) = x;
        plot (t,x);
        hold on;
        
        beta(i,:) = inv(z*z')*z*x;
        y = beta(i,1)+beta(i,2)*t;
        plot(t,y);
        hold on;
    end
    
    mean_f = mean(beta(:,1))+ mean(beta(:,2))*t;
    plot(t,mean_f,'x');
    hold on;
    
    fprintf('The mean function is u=%.5ft.\n',mean(beta(:,2)));
end

function x = random_walk
    n = 100;                  % Number of data points
    delta = 0.01;             % Drift
    x = delta + randn(n,1);   % White noise + drift
    x = cumsum(x); 
end