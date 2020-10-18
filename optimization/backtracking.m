% backtracking to find sufficient step size alpha to use in inexact 
% line search where we achieve a sufficient decrease in f at minimal cost

% INPUT
% alpha - initial step size
% x - the multi-dimensional point we're currently at 
% p - the direction/dimension we wanna take a step in 
% f — our function
% G - the gradient of our function (precomputed)

% OUTPUT
% alpha — a sufficient step size

function alpha = backtracking(x, p, f, G)

% Choose...
% alpha — initial alpha that is > 0 
% rho — rate of backtracking, between (0, 1)
% c — slope modulator, between (0, 1)
alpha = 1000;
rho = 0.5;
c = 0.1;

condition_not_met = true;
while condition_not_met
    % Define the wolfe condition line k*alpha + b
    wolfe_condition = (c * p' * G * alpha) + f(x);
    
    % Find the function value if we take a step of this size
    current_value = f(x + (alpha * p));
    
    % Check if current value is less than or equal to upper_limit
    % If it does, we have met our condition and found a sufficient alpha
    if current_value <= wolfe_condition
        condition_not_met = false;
    % Otherwise we need to test the next value of alpha, 
    % decreased by ratio of rho
    else
        alpha = alpha * rho;
    end
end







