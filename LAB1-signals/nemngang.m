t = linspace(0,1,1000);
initH = 1.5;
g = 9.8;
v0 = 4;
alpha0 = pi/4;
x = v0*cos(alpha0.*t);
y = initH + v0*sin(alpha0.*t) - 0.5*g.*t.^2;
t_gr = max(find(y>0));
plot(x,y);

