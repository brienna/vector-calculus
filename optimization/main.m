
% tests backtracking.m function

%x = [1; 1];
%f = @f_quadratic;
%G = find_gradient(f, x);
%p = -G; % the negative of the gradient (opposite direction)
%alpha = backtracking(x, p, f, G)


% tests gradient_descent.m function

% Set up plot
figure('Position', [0 0 1000 500]);
subplot(1, 2, 1);

%which_fig = 'f_quadratic';
%[x1, x2] = meshgrid(-60:60, -60:60);
%fx = x1.^2 + 10*x2.^2; % need to change this out with every different function

%which_fig = 'f_exp';
%[x1, x2] = meshgrid(-2:0.1:2, -1:0.1:1);
%fx = exp(x1 + 3.*x2-0.1) + exp(x1 - 3.*x2 - 0.1) + exp(-x1 - 0.1);

which_fig = 'f3';
[x1, x2] = meshgrid(-50:50, -50:50);
fx = 100 * (x2 - x1.^2).^2 + (1 - x1).^2; 

contour(x1, x2, fx, 40); 
colormap jet;
hold on;
plot(x(1,:), x(2,:), 'o');
hold on;

%x = [50; 50];
%f = @f_quadratic;
%x = [2.0; 1.0];
%f = @f_exp;
x = [40; 40];
f = @f3;
G = @find_gradient;
convergence_threshold = 0.0001;
N = 200;
[minimum_x, fx_at_minimum] = gradient_descent(f, G, x, convergence_threshold, N)

saveas(gcf, ['figs/' which_fig '.png'], 'png');

