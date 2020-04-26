function [edges]=myCurve(mu,sigma,rate)q = @(x) sigma^-1 .* exp((x - mu)./sigma).*exp(-exp((x - mu)./sigma));f = @(x) q(x)/integral(q, 0, 100);edges = ones(1, 3);counter = 1;percent = rate(counter);tol = 0.001;for i = 0:0.1:100    if abs(integral(f, 0, i) - percent) < tol        edges(counter) = i;        counter = counter + 1;        if counter > 3            return;        end        percent = percent + rate(counter);        tol = tol * 1.25;    endend

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% START OF AUTOGRADER FEEDBACK %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Your score is 10.05 / 15.
% 
%  Test Case #1 - 3/3 - myCurve(75, 10, [0.15         0.3         0.4        0.15])
% 
%  Test Case #2 - 0/3 - myCurve(60, 5, [0.2         0.3         0.4         0.1])
% % ** Expected output ** : 52.5         58.2         64.2
% % **   Your output   ** : 52.5            1            1
% % Right size and class, but wrong values (even accounting for roundoff)
% 
%  Test Case #3 - 0/3 - myCurve(92, 3, [0.1        0.41        0.41        0.08])
% % ** Expected output ** : 85.3           91         94.8
% % **   Your output   ** : 1  1  1
% % Right size and class, but wrong values (even accounting for roundoff)
% 
%  Test Case #4 - 3/3 - myCurve(20, 15, [0.15        0.25        0.45        0.15])
% 
%  Test Case #5 - 0/3 - myCurve(50, 8, [0.1         0.3         0.4         0.2])
% % ** Expected output ** : 32.2         44.7         53.8
% % **   Your output   ** : 32.1            1            1
% % Right size and class, but wrong values (even accounting for roundoff)
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% END OF AUTOGRADER FEEDBACK %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
