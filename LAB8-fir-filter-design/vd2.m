%wp = 0.3pi, ws = 0.6pi, Rp = 0.5 dB, As = 45 dB;
% Dua vao As va Bang 6.2, chung ta se su dung cua so Hamming de thiet ke bo
% loc
clear; close all; clc;
wp = 0.2*pi;
ws = 0.6*pi;
wc = (wp + ws)/2; % Tan so cat cua cua bo loc
M = 2*pi*3.47/(abs(ws - wp)); % Chieu dai cua bo loc
n = -(M-1)/2:(M-1)/2;
hd = ideal_LFP(wc, M);
w_hamm = hamming(M).';
h = hd.*w_hamm;

subplot(2,2,1)
stem(n, hd)
title('Dap ung xung cua bo loc ly tuong')
grid on
xlabel('n')
ylabel('hd(n)')

subplot(2,2,2)
stem(n, w_hamm)
title('Cua so Hamming')
grid on
xlabel('n')
ylabel('w_hamm(n)')

subplot(2,2,3)
stem(n, h)
title('Dap ung xung cua bo loc thuc te')
grid on
xlabel('n')
ylabel('h(n)')

subplot(2,2,4)
[mag, pha] = freqz(h, [1]);
plot(pha/pi, 20*log10(abs(mag)));
title('Dap ung bien do')
grid on
xlabel('pha/pi')
ylabel('|H(w)|')
