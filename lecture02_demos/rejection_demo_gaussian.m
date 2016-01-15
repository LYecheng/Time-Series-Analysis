function rejection_demo_gaussian(n)
% Sample n random numbers using the CDF
    A = zeros(1,n);
    tic
    for i = 1 : n
        A(i) = rejection_gaussian();
    end
    toc
    disp(['Rejection method, gaussian, time elapsed: ', num2str(toc)])
    count = numel(~isnan(A));
    disp(['Sucessfully sampled ', num2str(count), ' data points.']);
    
    % Plot histogram of results
    % The x-axis doesn't correspond array indices, not
    % the real values.
    [counts, bins] = hist(A);
    counts = counts / numel(A);
    bar(bins, counts)
end

function Y = rejection_gaussian
    for i = 1 : 1e12
        Y = -5 + (5-(-5)) * rand(1);
        U = rand(1);
        if U < exp(-Y^2/2)
            return
        end
    end
    Y = NaN
end