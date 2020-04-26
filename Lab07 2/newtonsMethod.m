function [rt, n_iter] = newtonsMethod(f, df, x0, tol, max_iter)
if ~isa(f, 'function_handle')
    disp('f must be a function handle');
end
if ~isa(df, 'function_handle')
    disp('df must be a function handle');
end
if ~isa(x0, 'double')
    disp('x0 must be a double');
end
if ~isa(tol, 'double')
    disp('tol must be a double');
end
if ~isa(max_iter, 'double')
    disp('max_iter must be a double');
end

if abs(f(x0)) <= tol
    rt = x0;
    n_iter = 0;
    return;
end
for i = 1:max_iter
    if df(x0) == 0
        rt = NaN;
        n_iter = Inf;
        return;
    end
    x0 = x0 - f(x0)/df(x0);
    if abs(f(x0)) <= tol
        rt = x0;
        n_iter = i;
        return;
    end
end
rt = NaN;
n_iter = max_iter;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% START OF AUTOGRADER FEEDBACK %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Well done, your score is 10 / 10
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% END OF AUTOGRADER FEEDBACK %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
