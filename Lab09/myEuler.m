function [y] = myEuler(f,tspan,y0,N)
    y(1) = y0;
    height = (tspan(2) - tspan(1)) / N;
    t = [tspan(1):height:tspan(2)];
    for i = 1:N
        y(i + 1) = y(i) + height * f(t(i), y(i));
    end
end
