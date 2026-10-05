function [y n] = myConv(x1, n1, x2, n2)
len = length(x1) + length(x2) - 1;
y = zeros(1, len);
y1 = zeros(1, len);
y2 = zeros(1, len);
y1(1:length(x1)) = x1;
y2(1:length(x2)) = x2;
for i = 1:len
    for j = 1:i
        y(i) = y(i) + y1(j)*y2(i+1-j);
    end
end
n = n1(1) + n2(1) : n1(end) +n2(end);
end