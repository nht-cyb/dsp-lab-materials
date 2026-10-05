a = [1 1 -3/4];
b = [1];
[h1 n] = impz(b, a, 10);
[u n] = rect_pulse(0, 10, 0);
h2 = 1/4*(1/2).^n.*u + 3/4*(-3/2).^n.*u;
subplot(3,1,1)
stem(h1)
subplot(3,1,2)
stem(h2)
y = filter(b, a, 2*sin(0.1*pi.*n));
subplot(3,1,3)
stem(y)