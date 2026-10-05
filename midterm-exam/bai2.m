t = 1;
fs = 1000;
t_total = 3*t;
t_axis = linspace(0, t_total, t_total*fs);

f1 = 300;
x1 = sin(2*pi*f1*t_axis(1:t*fs));

f2 = 400;
x2 = sin(2*pi*f1*t_axis(t*fs+1:2*t*fs)) ...
   + sin(2*pi*f2*t_axis(t*fs+1:2*t*fs));

f3 = 500;
x3 = sin(2*pi*f1*t_axis(2*t*fs+1:3*t*fs)) ...
   + sin(2*pi*f2*t_axis(2*t*fs+1:3*t*fs)) ...
   + sin(2*pi*f3*t_axis(2*t*fs+1:3*t*fs));

x = [x1, x2, x3];

figure;
plot(t_axis, x);
title('Tin hieu ');
xlabel('Thoi gian (s)');
ylabel('Bien do');
grid on;
legend('Tin hieu tong hop');