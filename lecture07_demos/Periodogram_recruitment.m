f = load('rec_series.txt');
%g=load('soi.txt');
n=numel(f);
f = f-mean(f);
fhat = fft(f)/n;
e1 = sum(fhat.*conj(fhat));
e2 = sum(f.^2)/n;

fprintf(1,'sum(fhat^2) %f, sum(f^2) %f\n', e1, e2);

