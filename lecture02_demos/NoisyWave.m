% Generates and plots a sinusoidal waveform with additive noise.
% From Shumway and Stoffer, Time Series Analysis and Its Applications, EZ - Third Edition
% Section 1.3

r=2;
n=500;
A = 2;                   % Amplitude
omega = 1/50;            % Oscillation frequency
phi = .6*pi;             % Phase shift
w = r*(rand(1,n+1)-.5);  % Noise term
t=0:n;

f = A*cos(2*pi*omega*t + phi) + w;

plot(t,f);
