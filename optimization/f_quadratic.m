function y = f_quadratic(x)

% quadratic function x1^2 + 10x2^2
% input x should be in 2 x N form (column)

x1 = x(1, :);
x2 = x(2, :);

y = x1.^2 + 10.*x2.^2;
