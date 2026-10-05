f=1000;
t=0:1/(50*f):3/f;
x = sin(2*pi*f*t);
figure;
subplot(4,1,1);
plot(t,x,'r'); % show continued signal
hold on;
stem(t,x); % show sampled signal
grid on;
t1=0:1/(10*f):3/f;
x1 = sin(2*pi*f*t1);
subplot(4,1,2);
stem(t1,x1);
grid on; % show sampled signal 1
t2=0:1/(1.5*f):3/f;
x2 = sin(2*pi*f*t2);
subplot(4,1,3);
stem(t2,x2);
grid on; % show sampled signal 2
t3=0:1/(100*f):3/f;
x3 = sin(2*pi*f*t3);
subplot(4,1,4);
stem(t3,x3); % show sampled signal 3
grid on;