% Q2. Simulation shown as per below

clc;

n=100000;

no_of_policyholders = 1000;
claim_prob = 0.05;
lambda = 1/800; 
sum_of_claim_ceiling = 50000;

simulated_prob = zeros(1,n);
f = zeros(1,no_of_policyholders);
exceed_sum = 0;

for i=1:n
    claim_sum = 0;
    for j = 1:no_of_policyholders
        U = rand;
        if(U <= claim_prob)
            f(j) = -log(1-rand)/lambda;
            claim_sum = claim_sum + f(j);
        end
    end
    
    if claim_sum > sum_of_claim_ceiling % 50,000
        exceed_sum = exceed_sum + 1;
    end
end

fprintf('simulated probability: %.5f \n', exceed_sum/n);

