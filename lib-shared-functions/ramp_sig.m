function [x n] = ramp_sig(n0, n1, n2)
    n = n1:n2;
    t = (n - n0) >= 0;
    x = (n - n0).*t;
    stem(n, x, 'LineWidth', 2);
    grid;
    xlabel("n");
    ylabel("x(n)");
    title("Ham doc don vi");
end
