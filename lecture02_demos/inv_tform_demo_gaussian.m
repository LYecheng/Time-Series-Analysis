function inv_tform_demo_gaussian(n)
    % Simple demo for constructing a gaussian distribution
    % using a discrete cumulative density funciton.  
    % Times and plots n samples from gaussian
    
    % Construct the CDF of gaussian distribution. 
    % This range covers over 99.99% of values
    % IMPORTANT: Performance depends on the width of interval
    % Note that this interval still gives very low precision
    x = -5 : 0.001 : 5;
    cdf = normcdf(x); 
    % p = normpdf(x);  % I couldn't get this to work?
    % cdf = cumsum(p);
    
    % Sample n random numbers using the CDF
    A = zeros(1,n);
    tic
    for i = 1 : n
        A(i) = inv_tform(cdf);
    end
    toc
    disp(['Discrete inv tform, gaussian, time elapsed: ', num2str(toc)])
    
    % Plot histogram of results
    % The x-axis doesn't correspond array indices, not
    % the real values.
    [counts, bins] = hist(A);
    counts = counts / numel(A);
    bar(bins, counts)

end

function X = inv_tform(cdf)
    % Samples a random number from a CDF
    U = rand(1);
    for i = 1 : numel(cdf)-1
        if U < cdf(i)
            X = i;
            return
        end
    end
    X = numel(cdf);
end


