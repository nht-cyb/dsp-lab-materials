t = 0:0.1:10;
x = zeros(1,length(t));
for k = 1:2:13
    x = x + (4*sin(2*pi*k*t))/(k*pi);
end
plot(t, x)