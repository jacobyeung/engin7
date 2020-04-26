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



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% START OF AUTOGRADER FEEDBACK %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Your score is 9.3125 / 10.
% 
%  Test Case #1 - 1.25/1.25
% 
%  Test Case #2 - 1.25/1.25
% 
%  Test Case #3 - 1.25/1.25
% 
%  Test Case #4 - 1.25/1.25
% 
%  Test Case #5 - 1.25/1.25
% 
%  Test Case #6 - 0.625/1.25
% % Output 1/2 : ** Expected output ** : -3.1958e-05
% % Output 1/2 : **   Your output   ** : NaN
% % Output 1/2 : Right size and class, but wrong values (even accounting for roundoff)
% 
%  Test Case #7 - 0.625/1.25
% % Output 1/2 : ** Expected output ** : -3.142
% % Output 1/2 : **   Your output   ** : NaN
% % Output 1/2 : Right size and class, but wrong values (even accounting for roundoff)
% 
%  Test Case #8 - 1.25/1.25
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% END OF AUTOGRADER FEEDBACK %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
