function [ pi ] = MarkovChain( X, pdf, nsteps)

[N  ~]= size(pdf);      %number of states in process
cdf = (cumsum(pdf'))'; %cdf
pi = zeros(N,1);      %# of time state j visited

for i=1:nsteps           %iterate over chain
    rn = rand();           %uniform random number
    tmp = cdf(X,:);      %pdf for state transitions 
                                %from current state
    j = 1;
    cutoff = tmp(j);
    while (rn > cutoff)
        j  = j + 1;
        cutoff = tmp(j);
    endm
    X=j;
    pi(j) = pi(j) + 1;
    
end
pi=pi./nsteps;

end
