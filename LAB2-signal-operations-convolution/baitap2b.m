n1 = -20;
n2 = 20;
n = n1:n2;
[u nx] = rect_pulse(n1, n2, 0);
[u1 nx1] = rect_pulse(n1, n2, 5);
[u2 nx2] = rect_pulse(n1, n2, 10);
[u3 nx3] = rect_pulse(n1, n2, 15);
[h1 nh1] = sig_add(10*u, nx, -5*u1, nx1);
[h2 nh2] = sig_add(h1, nh1, -10*u2, nx2);
[h n] = sig_add(h2, nh2, 5*u3, nx3);
stem(n, h)