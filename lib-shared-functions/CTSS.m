function [B, A ,K] = CTSS(b, a)
fprintf('20020637');
[R,P,K] = residuez(b,a);
n = length(R); % số phân thựcc trước khi quy đồng
k = floor(n / 2);
% phần nguyên của n / 2
% nếu n chẵn thì có k phân thức, n lẻ có k+1 phân thức
A = {};
B = {};
for i=1:k
% ghép các phân thức
r1 = R(i*2-1);
r2 = R(i*2);
p1 = P(i*2-1);
p2 = P(i*2);
A{i} = poly([p1, p2]); % hệ số của mẫu phân thức
B{i} = [r1 + r2 -(p1*r2 + p2*r1)]; % hệ số của tử phân
end
if (k * 2 ~= n)
% nếu k lẻ thì phân thức cuối để nguyên
B{k + 1} = [R(n)];
A{k + 1} = poly([P(n)]);
end
end