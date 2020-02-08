function [d1,d2,d3,d4,d5,d6,d7,d8,d9,d10] = myMathCalculations(a, b, c, x)
d1 = (x - (1 / (a * b)))^(-2);
d2 = c ^ (a * b);
d3 = c ^ (1 / a);
d4 = log10(a + b);
d5 = (a^2  + 1) / ((b*x - 1) * (x + c^b));
d6 = log(abs(cos(a + b)));
d7 = log(abs(sin(a / b))) / (log(2));
d8 = cos((a^2 + b^2) / (sqrt(a^2 + 1)));
d9 = cos(sin(x / 2 + 1));
d10= cos(a) * sin(b) - cos(b) * sin(a);
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% START OF AUTOGRADER FEEDBACK %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Well done, your score is 40 / 40
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% END OF AUTOGRADER FEEDBACK %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
