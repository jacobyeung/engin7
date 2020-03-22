function [rt, n_iter] = bisectionMethod(f, interval, tol, max_iter)
if ~isa(f, 'function_handle')
    disp('f must be a function handle');
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
if abs(f((interval(2) + interval(1))/2)) <= tol
    rt = ((interval(2) + interval(1))/2);
    n_iter = 0;
    return;
end
for i = 1:max_iter
    mid = (interval(2) + interval(1))/2;
    if f(interval(2)) * f(mid) > 0
        interval(2) = mid;
    elseif f(interval(2)) * f(mid) < 0
        interval(1) = mid;
    end
    if abs(f(mid)) <= tol
        rt = mid;
        n_iter = i - 1;
        return;
    end

end
rt = NaN;
n_iter = max_iter;
end

