% y[n] - (5/2)y[n-1] + y[n-2] = x[n] 

[u na] = step_sig(0,0,20);

%ha = (1/3)*(2.^na).*x -(2/3)*((1/2).^na).*x;
%figure(1);
%subplot(3,1,1);
%stem(na, ha);

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
x1 = 2.^(-n).*step_sig(0,n(1), n(length(n)));
y1 = filter(B, A, x1);
figure(1);
subplot(3,1,3);
stem(y1);
title('x(n) response');
xlabel('n');
ylabel('y(n)');


