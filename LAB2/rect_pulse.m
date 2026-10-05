function [x n] = rect_pulse(n1, n2, n0)
n  = [n1: n2];
x = [(n-n0)>=0];
stem(n,x);
end