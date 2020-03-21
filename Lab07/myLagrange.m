function [y_dot,p] = myLagrange(x,y,x_dot)
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

