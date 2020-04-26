function [integral] = mySimpson(f,interval,N)
h = (interval(2) - interval(1))/N;
x = [interval(1):h:interval(2)];
odd = 0;
even = 0;
for i = 2:2:N
    odd = odd + f(x(i));
end
for i = 3:2:(N-1)
    even = even + f(x(i));
end
integral = h/3*(f(x(1)) + 4*odd + 2*even + f(x(end)));
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
