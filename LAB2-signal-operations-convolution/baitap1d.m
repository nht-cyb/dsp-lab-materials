n1 = -20;
n2 = 20;
[x1 nx1] = rect_pulse(n1, n2, -1);
[x2 nx2] = rect_pulse(n1, n2, 4);
[x3 nx3] = sig_add(x1, nx1, x2, nx2);
x = ((1/4).^(-nx3)).*x3
stem(nx3,x);