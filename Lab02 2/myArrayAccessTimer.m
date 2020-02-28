function [time1, time2, time3] = myArrayAccessTimer(matrix)

    tic;
    x = matrix(1, 1);
    time1 = toc;

    tic;
    y = matrix(end, end);
    time2 = toc;

    tic;
    coordinates = randi([1 1000], 1, 2);
    z = matrix(coordinates(1), coordinates(2));
    time3 = toc;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% START OF AUTOGRADER FEEDBACK %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Well done, your score is 10 / 10
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% END OF AUTOGRADER FEEDBACK %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
