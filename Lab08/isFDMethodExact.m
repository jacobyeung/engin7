function [isExact,exact_val,fd_approx] = isFDMethodExact(p,x,method)
dp = polyder(p);
y = polyval(p, x);
exact_val = polyval(dp, x(2:(end-1)));
dx = abs(x(2)-x(1));
if strcmp(method, '1stD-forward')
    fd_approx = myDerivative(y, dx, 1, 'forward');
elseif strcmp(method, '1stD-backward')
    fd_approx = myDerivative(y, dx, 1, 'backward');
elseif strcmp(method, '1stD-central')
    fd_approx = myDerivative(y, dx, 1, 'central');
elseif strcmp(method, '2ndD-central')
    fd_approx = myDerivative(y, dx, 2, 'central');
else
    disp('method type invalid');
    return;
end
isequalAbs = @(x,y,tol) ( abs(x-y) <= tol );
if isequalAbs(fd_approx, exact_val, 1*10^-5)
    isExact = true;
else
    isExact = false;
end
end
