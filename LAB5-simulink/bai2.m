t = 0:0.001:2;   % fine step: the highest harmonic is 13 Hz
x = zeros(1,length(t));
for k = 1:2:13
    x = x + (4*sin(2*pi*k*t))/(k*pi);
end
plot(t, x); grid on;
title('Square wave from 7 odd harmonics'); xlabel('t (s)');