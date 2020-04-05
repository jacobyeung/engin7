function [derivative] = myDerivative(y,dx,n,method)
derivative = ones(1, length(y) - 2);
if n == 1
    if strcmp(method, 'forward')
        for i = 2:(length(y) - 1)
            derivative(i - 1) = (y(i + 1) - y(i))/dx;  
        end
    elseif strcmp(method, 'backward')
        for i = 2:(length(y) - 1)
            derivative(i - 1) = (y(i) - y(i-1))/dx;
        end
    else
        for i = 2:(length(y) - 1)
            derivative(i - 1) = (y(i+1) - y(i-1))/(2*dx);
        end
    end
else
    for i = 2:(length(y) - 1)
        derivative(i - 1) = (y(i+1) - 2*y(i) + y(i-1))/(dx^2);
    end
end
end

