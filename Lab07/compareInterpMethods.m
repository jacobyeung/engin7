function [fig, y_dot] = compareInterpMethods(x,y,x_dot,interp_methods)
fig = figure;
y_dot = [];
plot(x, y, 'o');
leg = {['original data']};
hold on;
index = 1;
if any(strcmp('linear', interp_methods))
    y_dot(index, :) = interp1(x, y, x_dot);
    plot(x_dot, y_dot(index, :));
    index = index + 1;
    leg(index, :) = {'linear'};
end
if any(strcmp('spline', interp_methods))
    y_dot(index, :) = spline(x, y, x_dot);
    plot(x_dot, y_dot(index, :));
    index = index + 1;
    leg(index, :) = {'spline'};
end
if any(strcmp('pchip', interp_methods))
    y_dot(index, :) = pchip(x, y, x_dot);
    plot(x_dot, y_dot(index, :));
    index = index + 1;
    leg(index, :) = {'pchip'};
end
if any(strcmp('lagrange', interp_methods))
    lagrange = myLagrange(x, y, x_dot);
    y_dot(index, :) = lagrange(1, :);
    plot(x_dot, y_dot(index, :));
    index = index + 1;
    leg(index, :) = {'lagrange'};
end
legend(leg(1:end));
end

