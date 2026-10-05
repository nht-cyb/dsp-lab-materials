function [x n] = rect_sig(n1, n2)
    n = n1:n2;
    x = n1 <= n & n <= n2;
    stem(n, x, 'LineWidth', 2);
    grid;
    xlabel("n");
    ylabel("x(n)");
    title("Xung chu nhat");
end