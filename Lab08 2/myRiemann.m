function [integral] = myRiemann(f,interval,N,method)
h = (interval(2) - interval(1))/N;
integral = 0;
x = [interval(1):h:interval(2)];
if strcmp(method, 'left')
    for i = 1:N
        integral = integral + h*f(x(i));
    end
elseif strcmp(method, 'right')
    for i = 1:N
        integral = integral + h*f(x(i+1));
    end
elseif strcmp(method, 'midpoint')
    for i = 1:N
        integral = integral + h*f((x(i)+x(i+1))/2);
    end
end
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% START OF AUTOGRADER FEEDBACK %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Well done, your score is 15 / 15
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% END OF AUTOGRADER FEEDBACK %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
