L = 1000; % Length of signal ;
NFFT = 2^nextpow2(L); % Next power of 2 from length of y
[y, fs] = audioread('audioclip1.wav');
subplot(4,1,1)
plot(y)
ylim([-0.5 0.5])
Y = fft(y,NFFT)/L;
f = fs/2*linspace(0,1,NFFT/2+1);
subplot(4,1,2)
plot(f,2*abs(Y(1:NFFT/2+1)))
title('Amplitude Spectrum of audioclip1.wav')
xlabel('Frequency (Hz)')
ylabel('|X(f)|');
z = downsample(y,4);
blo = fir1(34,0.125,chebwin(35,30));
outlo = filter(blo,1,y);
subplot(4,1,3)
plot(outlo)
ylim([-0.5 0.5])
OUTLO = fft(outlo,NFFT)/L;
subplot(4,1,4)
plot(f,2*abs(OUTLO(1:NFFT/2+1)))
sound(outlo)

