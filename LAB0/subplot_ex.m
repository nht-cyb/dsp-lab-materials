x1 = -10:10;
y1 = x1.^2;
x2 = -2:0.1:2;
y2 = sin(0.2*pi*x2);
y3 = exp(x1);

figure;
subplot(3,1,1);
plot(x1, y1); grid on;
title('y1 = x1^2'); xlabel('x1');
subplot(3,1,2);
plot(x2, y2); grid on;
title('y2 = sin(0.2\pi x2)'); xlabel('x2');
subplot(3,1,3);
plot(x1, y3); grid on;
title('y3 = e^{x1}'); xlabel('x1');
