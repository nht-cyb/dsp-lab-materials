function[x n] = plotDirac(n0)
n = -10:10;
x = [(n-n0)==0];
stem(n, x, 'LineWidth', 2);
grid;
xlabel("n");
