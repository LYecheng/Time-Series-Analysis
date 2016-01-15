
% Example: Q1(1000,200)

function Q1(signal_length,filter_length)

    % discrete samples between -3 to 3
    g0 = exp(-(rand(filter_length,1)*6-3).^2); % filter
   
    t = cputime; % start time
    x = 1:1:signal_length; % ARMA process
    w = randn(signal_length,1); % white noise
    fg_conv = zeros(signal_length+filter_length-1,1); % convolution

    % simulate ARMA
    for n=3:1:signal_length 
        x(1)=0;
        x(2)=0;
        x(n)=0.5*x(n-1)+0.1*x(n-2)+0.5*w(n-1)+w(n); % simulate process
    end
    
    
    
    % calculate convolution 
    for n=1:signal_length
        fg=g0.*x(n);
        for m=0:filter_length-1
            fg_conv(n+m,1)=fg_conv(n+m,1)+fg(m+1);
        end
    end
    fprintf('Time spent is %f for signal length %d. - in physical space\n',cputime-t,signal_length);
    fg_conv2 = conv(x,g0,'valid'); % use built-in function to double check convolution
    
    % repeat in fourier space
    t = cputime;
    g = zeros(signal_length,1);
    for i=1:signal_length
        if i<=filter_length
            g(i,1)=g0(i);
        else
            g(i,1)=0;
        end
    end
    g_hat = fft(g);
    f_hat = fft(x);
    f_tilde = ifft(f_hat'.*conj(g_hat));
    fprintf('Time spent is %f for signal length %d. - in Fourier space\n',cputime-t,signal_length);
    
    % plot the curves to verify that the results are same
    f_tilde_symmetric = zeros(signal_length,1);
    for i=1:signal_length
        f_tilde_symmetric(i)=f_tilde(signal_length+1-i);
    end
    
    hold off;
    plot(f_tilde_symmetric(filter_length:signal_length),'o');
    hold on;    
    plot(fg_conv(filter_length:signal_length),'x');
    hold on;
    
end


