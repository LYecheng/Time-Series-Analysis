% From Shumway and Stoffer, Time Series Analysis and Its Applications, EZ - Third Edition
% Section 1.3

% n = number of samples
n = 200;
% delta = drift
delta = .2;

%method 1

%x = zeros(n,1);
%x(1) = rand;
%for i=2:n
%    x(i) = delta + x(i-1) + 2*(rand-.5);
%end

%method 2
t = 0:n-1;
w = 2*rand(1,n)-1.0;
x = delta*t + cumsum(w);
plot(x);
