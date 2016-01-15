function inv_tform_demo(n)
    % From Ross, Simulation, Example 4a
    % Demo for inverse transform method.  Times and plots n samples from
    % the probability mass funciton.  
    
    % The probability mass function
    % p(i) = P{X = x(i)}
    p = [0.20 0.15 0.25 0.40];
    x = 1:4;

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Sample n random numbers using the unsorted PDF
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % The cumulative density function
    cdf = cumsum(p)
    
    % Sample n random numbers using the unsorted PDF
    A = zeros(1,n);
    tic
    for i = 1 : n
        A(i) = inv_tform(cdf);
    end
    toc
    disp(['Unsorted mass function. time elapsed: ', num2str(toc)])
    
    % Plot histogram
    [counts, bins] = hist(A,x);
    counts = counts / numel(A);
    bar(bins, counts)
    title('Unsorted mass function');
    uiwait();
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Sample n random numbers using the sorted PDF
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    [q, idx] = sort(p,'descend');    % Sort the mass function and keep indices
    cdf = cumsum(q)
    tic
    for i= 1 : n
        A(i) = inv_tform(cdf);
    end
    toc
    disp(['Sorted mass function. time elapsed: ', num2str(toc)])
    
    % Plot histogram
    [counts, bins] = hist(A,x);
    counts = counts / numel(A);
    bins = bins(idx);                % IMPORTANT: Reorder bins using idx
    bar(bins, counts)
    title('Sorted mass function');
    uiwait();

end

function X = inv_tform(cdf)
    % Samples a random number from a CDF
    U = rand(1);
    for i = 1 : numel(cdf)-1
        if U < cdf(i)                % first index of cdf such that U > cdf is ~ x at which cdf(x) = U 
            X = i;
            return
        end
    end
    X = numel(cdf);
end


