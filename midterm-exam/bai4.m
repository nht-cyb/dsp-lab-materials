% Tao tin hieu mau chua nhieu
t = linspace(0, 1, 100);
noise = rand(1, length(t));
x = cos(2 * pi * t) + 0.5 * (rand(size(noise)) - 0.5);

% Loc tin hieu voi width = 5
width = 5;
smoothed_5 = myFilter(x, width);

% Loc tin hieu voi width = 20
width = 20;
smoothed_20 = myFilter(x, width);

% Hien thi ket qua truoc va sau khi loc

% Tin hieu goc
plot(t, x, 'b', 'LineWidth', 1.5);

% Tin hieu da loc voi width = 5
hold on;
plot(t, smoothed_5, 'r', 'LineWidth', 2);

% Tin hieu da loc voi width = 20
plot(t, smoothed_20, 'g', 'LineWidth', 2);

% Title
title('Tin hieu ');
xlabel('Thoi gian');
ylabel('Gia tri tin hieu');

% Chu thich cho do thi
legend('Tin hieu goc', 'Tin hieu loc width = 5', 'Tin hieu loc width = 20', 'Location', 'NorthWest');
