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



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% START OF AUTOGRADER FEEDBACK %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Your score is 10.05 / 15.
% 
%  Test Case #1 - 3/3 - damping(1000, 0.6, 5.5, [5  6], 1e-06, 50)
% 
%  Test Case #2 - 3/3 - damping(1000, 0.6, 4.97, [4.47        5.47], 1e-06, 50)
% 
%  Test Case #3 - 0/3 - damping(10, 999, 3.25, [2.25        4.25], 1e-05, 20)
% % ** Expected output ** : 3.5         2.5
% % **   Your output   ** : 3.5         3.5
% % Right size and class, but wrong values (even accounting for roundoff)
% 
%  Test Case #4 - 0/3 - damping(2, 876.5, 10, [9.3         10.7], 0.0001, 70)
% % ** Expected output ** : 2763.5      9.4999939
% % **   Your output   ** : 2763.5      10.500006
% % Right size and class, but wrong values (even accounting for roundoff)
% 
%  Test Case #5 - 0/3 - damping(0.2, 3330, 7, [5  9], 1e-07, 80)
% % ** Expected output ** : 10468.5             7.5
% % **   Your output   ** : 10468.5             6.5
% % Right size and class, but wrong values (even accounting for roundoff)
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% END OF AUTOGRADER FEEDBACK %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
