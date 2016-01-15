function box_muller_demo(n)
    % Samples n random numbers from gaussian
    % using Box-Muller transform

    A = zeros(1,n);
    tic
    for i = 1 : 2 : n
        [A(i), A(i+1)] = box_muller();
    end
    toc
    
    disp(['Box Muller, elapsed time: ', num2str(toc)])
    
    % Plot histogram
    [counts, bins] = hist(A);
    counts = counts / numel(A);
    bar(bins, counts)
    
end

function [Z1, Z2] = box_muller
    % Box-Muller transform
    % Returns two random numbers from gaussian distribution
    U = rand(1,2);
    Z1 = sqrt( -2*log(U(1)) ) * cos(2*pi*U(2));
    Z2 = sqrt( -2*log(U(1)) ) * sin(2*pi*U(2));
end
