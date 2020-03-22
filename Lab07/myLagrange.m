function [y_dot,p] = myLagrange(x,y,x_dot)
if ~isa(x, 'double')
    disp('x must be a double');
end
if ~isa(y, 'double')
    disp('y must be a double');
end
if ~isa(x_dot, 'double')
    disp('x_dot must be a double');
end
deg = [1:(size(x, 2) - 1)];
xgen = @(n) [n.^deg];
xs = [];
for i = 1:size(x, 2)
    xs(i, :) = cat(2, 1, xgen(x(i)));
end
xs;
p = flipud(xs\y.')';
ys = [];
for i = 1:size(x_dot, 2)
    ys(i, :) = cat(2, 1, xgen(x_dot(i)));
end
y_dot = (ys*fliplr(p)')';
end

