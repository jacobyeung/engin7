function [rts, fig] = newtons2D(f, dfdx, dfdy, X, Y, pts, n_iter)
fvec = f(X, Y);
fig = figure;
surf(X, Y, fvec);
hold on;
z = zeros(size(X, 1));
surf(X, Y, z);
xn = [X Y];
for i = 1:n_iter
    fvec = f(xn(1), xn(2));
    fgrad = dfdx(X, Y) + dfdy(X, Y);
    fnorm = (sqrt((dfdx(X, Y))^2 + (dfdy(X, Y))^2))^2;
    xn = xn - fvec*fgrad/fnorm;
end
xn(2, :)
end

