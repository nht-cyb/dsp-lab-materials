Fs = 8000;
Ts = 1/Fs;
t = [0:Ts:2];
f1 = 400;
f2 = 800;
f3 = 2000;
th1 = sin(2*pi*f1*t);
th2 = sin(2*pi*f2*t);
th3 = sin(2*pi*f3*t);

Tone_A = th1 + th2;            % wanted signal: 400 Hz + 800 Hz
noise = th3;                   % unwanted 2000 Hz tone
Tone_A_noise = Tone_A + noise; % signal to be filtered

fc = 1200;     % between 800 Hz (keep) and 2000 Hz (remove)
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