Fs = 8000;
Ts = 1/Fs;
t = [0:Ts:2];
f1 = 400;
f2 = 800;
f3 = 2000;
th1 = sin(2*pi*f1*t);
th2 = sin(2*pi*f2*t);
th3 = sin(2*pi*f3*t);

Signal = th1 + th2 + th3;

fc = 1800;
[b, a] = butter(6, fc/(Fs/2));
filtered = filter(b, a, Tone_A_noise);
figure(20020727)
subplot(2,2,1)
plot(t,Tone_A);
title("Tone_A");
xlim([0 0.01]);
subplot(2,2,2)
plot(t,noise);
xlim([0 0.01]);
title("noise");
subplot(2,2,3)
plot(t,Tone_A_noise);
xlim([0 0.01]);
title("Tone_A_noise");
subplot(2,2,4)
plot(t,filtered);
xlim([0 0.01]);
title("Tone_A_filtered");