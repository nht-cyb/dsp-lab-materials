% tach dap he thong thanh cac thanh phan noi tiep nhau
function [b0, A, B] = CTNT(b, a)
    b0 = b(1); b = b/b0; a0 = a(1); a = a/a0; b0 = b0/a0;
    M = length(b); N = length(a);
    if N > M
        b = [b zeros(1,N-M)];
    else
        a = [a zeros(1,M-N)];
        N = M;
    end
    K = floor(N/2); A = zeros(K, 3); B = zeros(K, 3);
    if 2*K == N
        b = [b 0];
        a = [a 0];
    end
    br = cplxpair(roots(b));
    ar = cplxpair(roots(a));
    
    for i = 1:2:2*K
        B(ceil(i/2),:) = poly(br(i:i+1));
        A(ceil(i/2),:) = poly(ar(i:i+1));
    end
end