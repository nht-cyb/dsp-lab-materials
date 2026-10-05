y1 = bai1func(-5)
y2 = bai1func(4)

x = -5:0.1:5;
y = bai1func(x);

figure(1);
plot(x, y);
xlabel("Input x");
ylabel("Output y");
