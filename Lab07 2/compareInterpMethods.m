function [fig, y_dot] = compareInterpMethods(x,y,x_dot,interp_methods)
if ~strcmp('double', class(x))
    disp('x must be double');
end
if ~strcmp('double', class(y))
    disp('y must be double');
end
if ~strcmp('double', class(x_dot))
    disp('x_dot must be double');
end
if ~strcmp('cell', class(interp_methods))
    disp('interp_methods must be cell');
end
fig = figure;
y_dot = [];
plot(x, y, 'o');
leg = {['original data']};
hold on;
index = 1;
if any(strcmp('linear', interp_methods))
    y_dot(index, :) = interp1(x, y, x_dot);
    plot(x_dot, y_dot(index, :));
    index = index + 1;
    leg(index, :) = {'linear'};
end
if any(strcmp('spline', interp_methods))
    y_dot(index, :) = spline(x, y, x_dot);
    plot(x_dot, y_dot(index, :));
    index = index + 1;
    leg(index, :) = {'spline'};
end
if any(strcmp('pchip', interp_methods))
    y_dot(index, :) = pchip(x, y, x_dot);
    plot(x_dot, y_dot(index, :));
    index = index + 1;
    leg(index, :) = {'pchip'};
end
if any(strcmp('lagrange', interp_methods))
    lagrange = myLagrange(x, y, x_dot);
    y_dot(index, :) = lagrange(1, :);
    plot(x_dot, y_dot(index, :));
    index = index + 1;
    leg(index, :) = {'lagrange'};
end
legend(leg(1:end));
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% START OF AUTOGRADER FEEDBACK %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Your score is 13.35 / 15.
% 
%  Test Case #1 - 1.5/3 - compareInterpMethods([1   2   3   4   5   6   7   8   9  10], [4.5            2          0.5            0          0.5            2          4.5            0          4.5           10], [1          1.1          1.2          1.3          1.4          1.5          1.6          1.7          1.8          1.9            2          2.1          2.2          2.3          2.4          2.5          2.6          2.7          2.8          2.9            3          3.1          3.2          3.3          3.4          3.5          3.6          3.7          3.8          3.9            4          4.1          4.2          4.3          4.4          4.5          4.6          4.7          4.8          4.9            5          5.1          5.2          5.3          5.4          5.5          5.6          5.7          5.8          5.9            6          6.1          6.2          6.3          6.4          6.5          6.6          6.7          6.8          6.9            7          7.1          7.2          7.3          7.4          7.5          7.6          7.7          7.8          7.9            8          8.1          8.2          8.3          8.4          8.5          8.6          8.7          8.8          8.9            9          9.1          9.2          9.3          9.4          9.5          9.6          9.7          9.8          9.9           10], {'linear', 'lagrange', 'spline', 'pchip'})
% % Output 2/2 : ** Expected output ** : 4.5         4.25            4         3.75          3.5         3.25            3         2.75          2.5         2.25            2         1.85          1.7         1.55          1.4         1.25          1.1         0.95          0.8         0.65          0.5         0.45          0.4         0.35          0.3         0.25          0.2         0.15          0.1         0.05            0         0.05          0.1         0.15          0.2         0.25          0.3         0.35          0.4         0.45          0.5         0.65          0.8         0.95          1.1         1.25          1.4         1.55          1.7         1.85            2         2.25          2.5         2.75            3         3.25          3.5         3.75            4         4.25          4.5         4.05          3.6         3.15          2.7         2.25          1.8         1.35          0.9         0.45            0         0.45          0.9         1.35          1.8         2.25          2.7         3.15          3.6         4.05          4.5         5.05          5.6         6.15          6.7         7.25          7.8         8.35          8.9         9.45           10 **   Your output   ** : 4.5         4.25            4         3.75          3.5         3.25            3         2.75          2.5         2.25            2         1.85          1.7         1.55          1.4         1.25          1.1         0.95          0.8         0.65          0.5         0.45          0.4         0.35          0.3         0.25          0.2         0.15          0.1         0.05            0         0.05          0.1         0.15          0.2         0.25          0.3         0.35          0.4         0.45          0.5         0.65          0.8         0.95          1.1         1.25          1.4         1.55          1.7         1.85            2         2.25          2.5         2.75            3         3.25          3.5         3.75            4         4.25          4.5         4.05          3.6         3.15          2.7         2.25          1.8         1.35          0.9         0.45            0         0.45          0.9         1.35          1.8         2.25          2.7         3.15          3.6         4.05          4.5         5.05          5.6         6.15          6.7         7.25          7.8         8.35          8.9         9.45           10
% % Output 2/2 : **                 **   4.5      1.69908      0.18574    -0.438439    -0.482471    -0.180908     0.293074     0.816253      1.30548      1.70915            2      2.16893      2.21991       2.1658      2.02486      1.81812      1.56718      1.29273      1.01339     0.744945          0.5     0.287778     0.114202   -0.0178809    -0.108359    -0.159424     -0.17509    -0.160694    -0.122395   -0.0666945   6.9349e-12    0.0717624     0.143471     0.211066     0.271725     0.323975      0.36772     0.404207     0.435911     0.466378          0.5     0.541758     0.596925     0.670751     0.768138     0.893311      1.04951      1.23871      1.46135      1.71616            2      2.30779       2.6325      2.96525      3.29545      3.61108      3.89903      4.14551      4.33662       4.4589          4.5      4.44943      4.29928        4.045      3.68619      3.22729      2.67827      2.05517      1.38051     0.683495 -1.05842e-10    -0.627801     -1.15214     -1.52079     -1.67876     -1.57056     -1.14311    -0.349543     0.846236       2.4639          4.5      6.91997      9.64881      12.5602      15.4642      18.0925      20.0826      20.9588      20.1119      16.7755           10 **                 ** : 4.5      4.20265      3.91604      3.64009      3.37472      3.11985      2.87538      2.64125      2.41736      2.20364            2      1.80636      1.62264      1.44875      1.28462      1.13015     0.985277     0.849906     0.723957      0.60735          0.5     0.401908     0.313404       0.2349     0.166809     0.109541    0.0635108    0.0291292   0.00680866  -0.00303847            0    0.0160065    0.0437444    0.0816472     0.128148     0.181682      0.24068     0.303578     0.368808     0.434804          0.5     0.564066     0.631618     0.708511     0.800598     0.913732      1.05377      1.22656      1.43796      1.69382            2      2.35773      2.74978      3.15431      3.54946      3.91339      4.22425      4.46018      4.59935      4.61991          4.5      4.22701      3.82525      3.32825      2.76956      2.18271      1.60125      1.05871     0.588624     0.224542            0   -0.0597722    0.0372257     0.274686     0.636301      1.10576      1.66676        2.303      2.99815      3.73592          4.5      5.27408      6.04185        6.787      7.49324      8.14424       8.7237      9.21531      9.60277      9.86977           10
% % Output 2/2 : **                 **   4.5      4.20265      3.91604      3.64009      3.37472      3.11985      2.87538      2.64125      2.41736      2.20364            2      1.80636      1.62264      1.44875      1.28462      1.13015     0.985277     0.849906     0.723957      0.60735          0.5     0.401908     0.313404       0.2349     0.166809     0.109541    0.0635108    0.0291292   0.00680866  -0.00303847            0    0.0160065    0.0437444    0.0816472     0.128148     0.181682      0.24068     0.303578     0.368808     0.434804          0.5     0.564066     0.631618     0.708511     0.800598     0.913732      1.05377      1.22656      1.43796      1.69382            2      2.35773      2.74978      3.15431      3.54946      3.91339      4.22425      4.46018      4.59935      4.61991          4.5      4.22701      3.82525      3.32825      2.76956      2.18271      1.60125      1.05871     0.588624     0.224542            0   -0.0597722    0.0372257     0.274686     0.636301      1.10576      1.66676        2.303      2.99815      3.73592          4.5      5.27408      6.04185        6.787      7.49324      8.14424       8.7237      9.21531      9.60277      9.86977           10 **                 ** : 4.5      4.20388        3.916      3.63712        3.368      3.10938        2.862      2.62662        2.404      2.19488            2      1.81287        1.628      1.44763        1.274      1.10938        0.956     0.816125        0.692     0.585875          0.5      0.42525        0.352      0.28175        0.216      0.15625        0.104      0.06075        0.028      0.00725            0      0.00725        0.028      0.06075        0.104      0.15625        0.216      0.28175        0.352      0.42525          0.5     0.585875        0.692     0.816125        0.956      1.10938        1.274      1.44763        1.628      1.81287            2      2.22187          2.5      2.81562         3.15      3.48438          3.8      4.07812          4.3      4.44688          4.5        4.374        4.032        3.528        2.916         2.25        1.584        0.972        0.468        0.126            0      0.08145       0.3096      0.66015       1.1088      1.63125       2.2032      2.80035       3.3984      3.97305          4.5      5.00095       5.5136      6.03765       6.5728      7.11875       7.6752      8.24185       8.8184      9.40455           10
% % Output 2/2 : **                 **   4.5      4.20388        3.916      3.63712        3.368      3.10938        2.862      2.62662        2.404      2.19488            2      1.81287        1.628      1.44763        1.274      1.10938        0.956     0.816125        0.692     0.585875          0.5      0.42525        0.352      0.28175        0.216      0.15625        0.104      0.06075        0.028      0.00725            0      0.00725        0.028      0.06075        0.104      0.15625        0.216      0.28175        0.352      0.42525          0.5     0.585875        0.692     0.816125        0.956      1.10938        1.274      1.44763        1.628      1.81287            2      2.22187          2.5      2.81562         3.15      3.48438          3.8      4.07812          4.3      4.44688          4.5        4.374        4.032        3.528        2.916         2.25        1.584        0.972        0.468        0.126            0      0.08145       0.3096      0.66015       1.1088      1.63125       2.2032      2.80035       3.3984      3.97305          4.5      5.00095       5.5136      6.03765       6.5728      7.11875       7.6752      8.24185       8.8184      9.40455           10 **                 ** : 4.5      1.69908      0.18574    -0.438439    -0.482471    -0.180908     0.293074     0.816253      1.30548      1.70915            2      2.16893      2.21991       2.1658      2.02486      1.81812      1.56718      1.29273      1.01339     0.744945          0.5     0.287778     0.114202   -0.0178809    -0.108359    -0.159424     -0.17509    -0.160694    -0.122395   -0.0666945  1.20053e-10    0.0717624     0.143471     0.211066     0.271725     0.323975      0.36772     0.404207     0.435911     0.466378          0.5     0.541758     0.596925     0.670751     0.768138     0.893311      1.04951      1.23871      1.46135      1.71616            2      2.30779       2.6325      2.96525      3.29545      3.61108      3.89903      4.14551      4.33662       4.4589          4.5      4.44943      4.29928        4.045      3.68619      3.22729      2.67827      2.05517      1.38051     0.683495 -3.49246e-10    -0.627801     -1.15214     -1.52079     -1.67876     -1.57056     -1.14311    -0.349543     0.846236       2.4639          4.5      6.91997      9.64881      12.5602      15.4642      18.0925      20.0826      20.9588      20.1119      16.7755           10
% % Output 2/2 : Right size and class, but wrong values (even accounting for roundoff)
% 
%  Test Case #2 - 3/3 - compareInterpMethods([1   2   3   4   5   6   7   8   9  10], [4.5            2          0.5            0          0.5            2          4.5            0          4.5           10], [1          1.1          1.2          1.3          1.4          1.5          1.6          1.7          1.8          1.9            2          2.1          2.2          2.3          2.4          2.5          2.6          2.7          2.8          2.9            3          3.1          3.2          3.3          3.4          3.5          3.6          3.7          3.8          3.9            4          4.1          4.2          4.3          4.4          4.5          4.6          4.7          4.8          4.9            5          5.1          5.2          5.3          5.4          5.5          5.6          5.7          5.8          5.9            6          6.1          6.2          6.3          6.4          6.5          6.6          6.7          6.8          6.9            7          7.1          7.2          7.3          7.4          7.5          7.6          7.7          7.8          7.9            8          8.1          8.2          8.3          8.4          8.5          8.6          8.7          8.8          8.9            9          9.1          9.2          9.3          9.4          9.5          9.6          9.7          9.8          9.9           10], {'linear', 'spline'})
% 
%  Test Case #3 - 3/3
% 
%  Test Case #4 - 1.5/3 - compareInterpMethods([1   2   3   4   5   6   7   8   9  10], [4.5            2          0.5            0          0.5            2          4.5            0          4.5           10], [1.5         2.5         3.5         4.5         5.5         6.5         7.5         8.5         9.5], {'linear', 'lagrange', 'spline', 'pchip'})
% % Output 2/2 : ** Expected output ** :      3.25         1.25         0.25         0.25         1.25         3.25         2.25         2.25         7.25 **   Your output   ** :      3.25         1.25         0.25         0.25         1.25         3.25         2.25         2.25         7.25
% % Output 2/2 : **                 **   -0.180908      1.81812    -0.159424     0.323975     0.893311      3.61108      3.22729     -1.57056      18.0925 **                 ** :   3.11985      1.13015     0.109541     0.181682     0.913732      3.91339      2.18271      1.10576      8.14424
% % Output 2/2 : **                 **     3.11985      1.13015     0.109541     0.181682     0.913732      3.91339      2.18271      1.10576      8.14424 **                 ** :   3.10938      1.10938      0.15625      0.15625      1.10938      3.48438         2.25      1.63125      7.11875
% % Output 2/2 : **                 **     3.10938      1.10938      0.15625      0.15625      1.10938      3.48438         2.25      1.63125      7.11875 **                 ** : -0.180908      1.81812    -0.159424     0.323975     0.893311      3.61108      3.22729     -1.57056      18.0925
% % Output 2/2 : Right size and class, but wrong values (even accounting for roundoff)
% 
%  Test Case #5 - 3/3
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% END OF AUTOGRADER FEEDBACK %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
