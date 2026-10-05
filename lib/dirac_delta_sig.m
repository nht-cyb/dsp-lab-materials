function [x n] = dirac_delta_sig(n0, n1, n2)
    n = n1:n2;
    x = (n - n0) == 0;
    stem(n, x, 'LineWidth', 2);
    grid;
    xlabel("n");
    ylabel("x(n)");
    title("Xung don vi");
end