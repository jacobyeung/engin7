function [rts, fig] = newtons2D(f, dfdx, dfdy, X, Y, pts, n_iter)
if ~isa(f, 'function_handle')
    disp('f must be a function handle');
end
if ~isa(dfdx, 'function_handle')
    disp('dfdx must be a function handle');
end
if ~isa(dfdy, 'function_handle')
    disp('dfdy must be a function handle');
end
if ~isa(X, 'double')
    disp('X must be a double');
end
if ~isa(Y, 'double')
    disp('Y must be a double');
end
if ~isa(n_iter, 'double')
    disp('n_iter must be a double');
end
if ~isa(pts, 'double')
    disp('pts must be a double');
end

fvec = f(X, Y);
xn = pts;
for i = 1:n_iter
    for j = 1:size(pts, 1)
        x = xn(j, 1);
        y = xn(j, 2);
        dx = dfdx(x, y);
        dy = dfdy(x, y);
        v = sqrt(dx^2 + dy^2)^2;
        xn(j, 1) = x - (f(x, y) * dx / v);
        xn(j, 2) = y - (f(x, y) * dy / v);
    end
end
rts = xn;
fig = figure;
surf(X, Y, fvec);
hold on;
z = zeros(size(X, 1));
surf(X, Y, z);
fvec = f(xn(:, 1), xn(:, 2));
plot3(xn(:, 1), xn(:, 2), fvec, 'r');
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% START OF AUTOGRADER FEEDBACK %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Your score is 17.8 / 20.
% 
%  Test Case #1 - 4/4
% 
%  Test Case #2 - 4/4
% 
%  Test Case #3 - 0/4
% % Error thrown, line 71 in function surf, line 42 in function newtons2D: Error using surf (line 71)
% Data dimensions must agree.
% 
%  Test Case #4 - 4/4
% 
%  Test Case #5 - 4/4
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% END OF AUTOGRADER FEEDBACK %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
