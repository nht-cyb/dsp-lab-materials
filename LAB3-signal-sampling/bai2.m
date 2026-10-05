clear all; clc;
Fs = 1000; % Sampling frequency
T = 1/Fs; % Sample time
L = 1000; % Length of signal ;
t = (0:L-1)*T; % Time vector
x = 0.7*sin(2*pi*50*t) + sin(2*pi*120*t);
y = x + 2*randn(size(t));
figure;
%%% Plot signal in time domain:
subplot(2,1,1)
plot(Fs*t(1:50),x(1:50))
title('Original signal in time domain')
subplot(2,1,2);
plot(Fs*t(1:50),y(1:50))
title('Noised signal in time domain')
xlabel('time (milliseconds)')
%%% Plot signal in frequency domain when Fsampling = 1000Hz:
figure;
NFFT = 2^nextpow2(L); % Next power of 2 from length of y
subplot(2,1,1);
X = fft(x,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2+1);
plot(f,2*abs(X(1:NFFT/2+1)))
title('Amplitude Spectrum of original x(t)')
xlabel('Frequency (Hz)')
ylabel('|X(f)|');
subplot(2,1,2);
Y = fft(y,NFFT)/L;
plot(f,2*abs(Y(1:NFFT/2+1)))
title('Amplitude Spectrum of noised signal y(t)')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|');