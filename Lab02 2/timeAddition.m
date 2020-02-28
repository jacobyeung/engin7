function output = timeAddition(input)
persistent count
if isempty(count)
    count = 0;
    count = count + 1;
    output = count + input;
else 
    count = count + 1;
    output = count + input;
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% START OF AUTOGRADER FEEDBACK %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Well done, your score is 17 / 17
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% END OF AUTOGRADER FEEDBACK %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
