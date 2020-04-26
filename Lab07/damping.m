function [t] = damping(k1,k2,x0,interval,tol, max_iter)
if ~isa(k1, 'double')
    disp('k1 must be a double');
end
if ~isa(k2, 'double')
    disp('k2 must be a double');
end
if ~isa(x0, 'double')
    disp('x0 must be a double');
end
if ~isa(interval, 'double')
    disp('interval must be a double');
end
if ~isa(tol, 'double')
    disp('tol must be a double');
end
if ~isa(max_iter, 'double')
    disp('max_iter must be a double');
end
syms x;
fn = @(x) k1 * (cos(pi * x))*exp(-x/(k2*pi));
df = eval(['@(x)' char(diff(fn(x)))]);
t(1) = newtonsMethod(fn, df, x0, tol, max_iter);
t(2) = bisectionMethod(fn, interval, tol, max_iter);
end

