function [x n] = real_exp_sig(a, n1, n2)
    n = n1:n2;
    x = a.^n;
    stem(n, x, 'LineWidth', 2);
    grid;
    xlabel("n");
    ylabel("x(n)");
    title("Ham mu thuc");
end