n = 500;             %signal length
f=randn(1,n);      %create a signal
m = 10;                %filter width
 % create filter weights, fill in all zeros
g = [ones(1,m)/m zeros(1,n-m)];
disp(g);

%fourier transform of f
fhat = fft(f); 
%fourier transform of g
ghat = fft(g);

%apply filter in fourier space
tmp = fhat.*conj(ghat);  

%convert back to time domain
ftilde1 = ifft(tmp);

%compare to physical space filter
%note that convol only requires non-zero weights
ftilde2 = conv(f,g(1:m),'valid');

plot(g);
hold on;
plot(ghat);
