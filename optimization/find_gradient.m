% Computes gradient of function.

% f - function
% x - the values for every dimension at which to calculate the gradient of f, must be a column vector 
% order - which order of cdf to use, aka the order of the gradient
% varargin - if h is provided or not, check this variable-length input arg
% if h is provided in varargin
% h - the size of the neighborhood on the function where we check the gradient


function G = find_gradient(f, x, order, varargin)

% Set value of h according to recommendation in prof notes
% as this value is small but doesn't carry the risk of 
% a large round-off error
% Change order if necessary, too?
if nargin < 4 % if h not provided
    h = sqrt(eps) * (1 + norm(x(:), inf)); % did one plus in case it turns out to be zero
else
    h = varargin{1};
end

if nargin < 3 % if order not provided
    order = 2;
end

% Initialize e identity matrix 
%e = eye(length(x), length(x))

f0 = f(x);

% O(h) central difference, takes 1 h-sized step forward
if order == 1 % if order is 1
    f2 = zeros(size(x));
    for i = 1:length(x) % for each dimension
        x2 = x % copy our entire x, we will alter one dimension at a time, so we don't want anything else changed
        x2(i) = x(i) + h % step forward
        f2(i) = f(x2) % evaluate the new value
    end
    G = (f2 - f0) / h;

% O(h^2) central difference, takes 1 h-sized step both forward and backward
elseif order == 2
    f2 = zeros(size(x)); 
    f3 = zeros(size(x));
    for i=1:length(x) % for each dimension
        x2 = x;
        x2(i) = x(i) + h; % step forward
        f2(i) = f(x2); % recalculate function values with the recent movement in the ith dimension
        x3 = x;
        x3(i) = x(i) - h; % step backward
        f3(i) = f(x3); % recalculate function values with the recent movement in the ith dimension
    end
    G = (f2 - f3) / (2 * h);
    
    
elseif order == 4
    f1 = zeros(size(x));
    f2 = zeros(size(x));
    f3 = zeros(size(x));
    f4 = zeros(size(x));
    
    for i=1:length(x) % for each dimension
        x1 = x; 
        x1(i) = x(i) + (2*h); % step forward 2h
        f1(i) = f(x1);
        
        x2 = x;
        x2(i) = x(i) + h; % step forward
        f2(i) = f(x2);
        
        x3 = x;
        x3(i) = x(i) - h; % step backward
        f3(i) = f(x3);
        
        x4 = x;
        x4(i) = x(i) - (2*h); % step backward 2h
        f4(i) = f(x4);
    end
    G = (-f1 + (8*f2) - (8*f3) + f4) / (12 *h);
    
    
end    
        


% can test this using 
    
    