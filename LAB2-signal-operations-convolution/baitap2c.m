n1 = -200;
n2 = 200;
n = n1:n2;
h = 2*sin(0.01*pi.*n).*cos(0.5*pi.*n)
stem(n, h)