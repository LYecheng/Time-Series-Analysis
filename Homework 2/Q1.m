
% Q1: expected value of X is 1, and variance of X is 1

clc;

n = 10000;

no_of_cards = 50;
hits_per_iteration = zeros(1, n);
hits_per_iteration_square = zeros(1, n);
EX = zeros(1, n);
VarX = zeros(1, n);

for i = 1:n
    p = randperm(no_of_cards);
    for j = 1:no_of_cards
        if j == p(j)
            hits_per_iteration(i) = hits_per_iteration(i)+1;
        end
    end
    hits_per_iteration_square(i) = hits_per_iteration(i) ^ 2;
    
    EX(i) = sum(hits_per_iteration) / i;
    VarX(i) = sum(hits_per_iteration_square) / i - EX(i);
end

fprintf('Expectation is %.5f, variance is %.5f\n', EX(n), VarX(n));

x = 1:1:n;
plot(x, EX, x, VarX);