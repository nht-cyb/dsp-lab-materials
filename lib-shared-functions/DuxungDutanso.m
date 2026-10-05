%% Hz = z + 2 / z - 0.5
% ve dap ung xung
A = [1 2];
B = [1 -0.5];
[h n] = impz(B, A);
figure(1);
stem(n, h);
xlabel('n');
ylabel('h(n)');
title('impulse response');

% ve diem khong diem cuc
figure(2);
zplane(A, B);
title('z plane');

% xac dinh tan so va pho bien do
[H W] = freqz(B, A, n);
figure(3);
stem(W, abs(H));
title('dap ung tan so pho bien do');
xlabel('w');
ylabel(['|H(w)|']);

% truyen dau vao, tinh dap ung ht x(n) = 2*0.9^n*u(n)
x1 = 2*(0.9.^n).*step_sig(0,n(1), n(length(n)));
y1 = filter(B, A, x1);
figure(4);
stem(n, y1);
title('output x1');
