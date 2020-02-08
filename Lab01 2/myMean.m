function [ave, abs_ave] = myMean(x1, x2, x3)
ave = (1 / 3) * (x1 + x2 + x3);
abs_ave = (1 / 3) * (abs(x1) + abs(x2) + abs(x3));
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
