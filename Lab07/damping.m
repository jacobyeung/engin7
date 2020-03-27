function [t] = damping(k1,k2,x0,interval,tol, max_iter)
syms x;
fn = @(x) k1 * (cos(pi * x))*exp(-x/(k2*pi));
df = eval(['@(x)' char(diff(fn(x)))]);
t(1) = newtonsMethod(fn, df, x0, tol, max_iter);
t(2) = bisectionMethod(fn, interval, tol, max_iter);
end

