function [true_rts, my_rts, n_iters] = myFzero(p, x0, interval, max_iter)
if ~isa(p, 'double')
    disp('p must be a double');
end
if ~isa(x0, 'double')
    disp('x0 must be a double');
end
if ~isa(interval, 'double')
    disp('interval must be a double');
end
if ~isa(max_iter, 'double')
    disp('max_iter must be a double');
end
true_rts = roots(p);
dim = [0:size(p, 2) - 1];
syms x;
fn = @(x) (x.^dim)*fliplr(p)';
[my_rts(1, :), fval, exit, output] = fzero(fn, x0);
n_iters(1, :) = output.iterations + output.intervaliterations - 1;
[my_rts(2, :), fval, exit, output] = fzero(fn, interval);
n_iters(2, :) = output.iterations + output.intervaliterations - 1;
f1 = eval(['@(x)' char(diff(fn(x)))]);
[my_rts(3, :), n_iters(3, :)] = newtonsMethod(fn, f1, x0, 3 * eps, max_iter);
[my_rts(4, :), n_iters(4, :)] = bisectionMethod(fn, interval, eps, max_iter);
my_rts = my_rts';
n_iters = n_iters';
end

