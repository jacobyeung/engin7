function [grade] = searchGrade(name,scores_lab04)
if nargin < 2
    load('scores_lab04.mat','scores_lab04');
end
%-------Don't change above code--------%
if strcmp(scores_lab04{1, 1}, name)
    [grade] = scores_lab04{1, 2};
else
    [grade] = searchGrade(name, scores_lab04(2:end, :));
end

