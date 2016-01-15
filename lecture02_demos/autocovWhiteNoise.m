%calculate autocovariance for white noise
%and filtered white noise with filter width
% = 3

n=1000;
m = 100000;
x = rand(n,m)-.5;
xf = zeros(n-2,m);

for j=1:m
    for i=1:n-2
        xf(i,j) = 1/3*(x(i,j) + x(i+1,j) + x(i+2,j));
    end
end

%autocovariance at lag 1 for unfiltered noise
x1 = x(1,:) - mean(x(1,:));
x2 = x(2,:) - mean(x(2,:));

cov = sum(x1.*x2)/m;
var = sum(x1.*x1)/m;
fprintf(1,'variance: %f\n', var);
fprintf(1,'co-variance lag 1: %f\n', cov);

%now same for filtered noise
xf1 = xf(1,:) - mean(xf(1,:));
xf2 = xf(2,:) - mean(xf(2,:));
xf3 = xf(3,:) - mean(xf(3,:));
xf4 = xf(4,:) - mean(xf(4,:));

cov = sum(xf1.*xf2)/m;
fprintf(1,'co-variance lag 1: %f\n', cov);
fprintf(1,'2/9*var: %f\n', 2/9*var);

cov = sum(xf1.*xf3)/m;
fprintf(1,'co-variance lag 2: %f\n', cov);
fprintf(1,'1/9*var: %f\n', 1/9*var);

cov = sum(xf1.*xf4)/m;
fprintf(1,'co-variance lag 3: %f\n', cov);

