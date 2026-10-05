b = [1];
a = [1, -5/2, 1];


[u, n] = step(0, 20, 0);

% H(z) = 1/(1 - 2.5z^-1 + z^-2) = (4/3)/(1 - 2z^-1) - (1/3)/(1 - 0.5z^-1)
h1 = (4/3)*2.^n.*u - (1/3)*(1/2).^n.*u;
figure(1);
subplot(3, 1, 1);
stem(n, h1);
xlabel('n');
ylabel('h1(n)');
title('Hàm phản hồi xung h(n) của hệ thống');

% Ve dap ung xung bang impz
A = [1 -5/2 1];
B = [1];
[h n] = impz(B, A);     % dung ham impz(hs x, hs y) de tinh dap ung xung
figure(1);
subplot(3,1,2);
stem(n, h);
title('impulse response');
xlabel('n');
ylabel('h(n)');


% ve diem cuc diem khong:
figure(2);
zplane(A, B);
title('H(z)');

% truyen dau vao, tinh dap ung ht: x(n) = 2^-n*u(n)
n = n.';    % impz returns a column, make it a row like step()
x1 = 2.^(-n).*step(n(1), n(end), 0);
y1 = filter(B, A, x1);
figure(1);
subplot(3,1,3);
stem(n, y1);
title('x(n) response');
xlabel('n');
ylabel('y(n)');


