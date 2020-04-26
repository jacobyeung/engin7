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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% START OF AUTOGRADER FEEDBACK %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Your score is 13.625 / 15.
% 
%  Test Case #1 - 2.5/2.5 - isFDMethodExact([3  2  1], [0         0.3         0.6         0.9         1.2         1.5], '1stD-forward')
% 
%  Test Case #2 - 2.5/2.5 - isFDMethodExact([3  2  1], [0         0.3         0.6         0.9         1.2         1.5], '1stD-central')
% 
%  Test Case #3 - 2.5/2.5 - isFDMethodExact([12  -2], [-10  -8  -6  -4  -2   0   2   4   6   8  10], '1stD-backward')
% 
%  Test Case #4 - 2.5/2.5 - isFDMethodExact([3 -2  1 -4], [0         0.3         0.6         0.9         1.2         1.5         1.8], '1stD-central')
% 
%  Test Case #5 - 0.83333/2.5 - isFDMethodExact([5  -3  12  -2], [-10         -9.5           -9         -8.5           -8         -7.5           -7         -6.5           -6         -5.5           -5         -4.5           -4         -3.5           -3         -2.5           -2         -1.5           -1         -0.5            0          0.5            1          1.5            2          2.5            3          3.5            4          4.5            5          5.5            6          6.5            7          7.5            8          8.5            9          9.5           10], '2ndD-central')
% % Output 1/3 : ** Expected output ** : 1
% % Output 1/3 : **   Your output   ** : 0
% % Output 1/3 : Right size and class, but wrong values
% % Output 2/3 : ** Expected output ** : -291 -276 -261  ...  249  264  279
% % Output 2/3 : **   Your output   ** : 1422.75           1281        1146.75  ...  1044.75           1173        1308.75
% % Output 2/3 : Right size and class, but wrong values (even accounting for roundoff)
% 
%  Test Case #6 - 1.6667/2.5 - isFDMethodExact([12   5  -3  12  -2], [-10         -9.5           -9         -8.5           -8         -7.5           -7         -6.5           -6         -5.5           -5         -4.5           -4         -3.5           -3         -2.5           -2         -1.5           -1         -0.5            0          0.5            1          1.5            2          2.5            3          3.5            4          4.5            5          5.5            6          6.5            7          7.5            8          8.5            9          9.5           10], '2ndD-central')
% % Output 2/3 : ** Expected output ** : 12705  11388  10143  ...  10653  11928  13275
% % Output 2/3 : **   Your output   ** : -39731.25          -33711       -28331.25  ...  30522.75           36165        42462.75
% % Output 2/3 : Right size and class, but wrong values (even accounting for roundoff)
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% END OF AUTOGRADER FEEDBACK %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
