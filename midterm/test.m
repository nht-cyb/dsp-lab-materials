% tao tin hieu nhieu x
t = linspace(0, 1, 100);
noise = rand(1, length(t));
x = sin(2*pi*t) + 0.5*(rand(size(noise))-0.5);

width = 5;

% Loc trung binh dong
smoothed = myFilter(x, width);

% Hien thi
figure;
plot(t, x, 'b', 'LineWidth', 1.5);
hold on;
plot(t, smoothed, 'r', 'LineWidth', 1.5);
legend('Tin hieu goc', 'Tin hieu da loc');
title('Bo loc trung binh dong width = 5');
xlabel('Thoi gian (t)');
ylabel('Gia tri');
grid on;