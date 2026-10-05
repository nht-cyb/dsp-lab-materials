function h_ideal = ideal_LFP(wc, L)
L = round(L);
if(mod(L,2) == 0)
    L = L + 1;
end
n = -(L - 1)/2 : (L-1)/2;
n(ceil(L/2)) = eps;
h_ideal = sin(wc*n)./(pi*n);
end