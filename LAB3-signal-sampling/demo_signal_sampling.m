clear; close all; clc;
f = 1000;
T = 1/f;
t = 0:T/50:3*T;
x = 3/2*sin(2*pi*f*t + pi/3) + 2*cos(2*pi*f*t/3);
figure
subplot(4,1,1)
plot(t,x, "LineWidth", 2); grid on; hold on
t1 = 0:T/2.5:3*T;
x1 = 3/2*sin(2*pi*f*t1 + pi/3) + 2*cos(2*pi*f*t1/3);
subplot(4,1,2)
plot(t1,x1, "LineWidth", 2); grid on; hold on
stem(t1,x1, "LineWidth", 2);
t2 = 0:T/6:3*T;
x2 = 3/2*sin(2*pi*f*t2 + pi/3) + 2*cos(2*pi*f*t2/3);
subplot(4,1,3)
plot(t2,x2, "LineWidth", 2); grid on; hold on
stem(t2,x2, "LineWidth", 2);
t3 = 0:T/25:3*T;
x3 = 3/2*sin(2*pi*f*t3 + pi/3) + 2*cos(2*pi*f*t3/3);
subplot(4,1,4)
plot(t3,x3, "LineWidth", 2); grid on; hold on
stem(t3,x3, "LineWidth", 2);