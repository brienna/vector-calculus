
% tests backtracking.m function

%x = [1; 1];
%f = @f_quadratic;
%G = find_gradient(f, x);
%p = -G; % the negative of the gradient (opposite direction)
%alpha = backtracking(x, p, f, G)


% tests gradient_descent.m function


x = [50; 50];
f = @f_quadratic;
%x = [2.0; 1.0];
%f = @f_exp;
%x = [2; 2];
%f = @f3;
G = @find_gradient;
convergence_threshold = 0.00001;
N = 1000;
[minimum_x, fx_at_minimum] = gradient_descent(f, G, x, convergence_threshold, N)
