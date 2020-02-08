function [sigma2, abs_sigma2] = myVar(x1, x2, x3)
[ave, abs_ave] = myMean(x1, x2, x3); 
sigma2 = (1 / 2) * (abs(x1 - ave)^2 + (x2 - ave)^2 + (x3 - ave)^2);
abs_sigma2 = (1 / 2) * (abs(abs(x1) - abs_ave)^2 + (abs(x2) - abs_ave)^2 + (abs(x3) - abs_ave)^2);
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% START OF AUTOGRADER FEEDBACK %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Well done, your score is 20 / 20
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% END OF AUTOGRADER FEEDBACK %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
