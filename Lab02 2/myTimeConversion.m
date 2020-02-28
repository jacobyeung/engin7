function [hours, minutes, message] = myTimeConversion(totalmins)
time = totalmins;
totalhours = 0;
while time >= 60
    totalhours = totalhours + 1;
    time = time - 60;
end
if totalmins == 1
    totalmins = int2str(totalmins);
    minutes = int2str(time);
    hours = int2str(totalhours);
    message = [totalmins ' minute = '  hours ' hours and ' minutes ' minute'];
elseif time == 1 && totalhours == 1
    totalmins = int2str(totalmins);
    minutes = int2str(time);
    hours = int2str(totalhours);
    message = [totalmins ' minutes = '  hours ' hour and ' minutes ' minute'];
elseif time == 1
    totalmins = int2str(totalmins);
    minutes = int2str(time);
    hours = int2str(totalhours);
    message = [totalmins ' minutes = ' hours ' hours and ' minutes ' minute'];
elseif totalhours == 1
    totalmins = int2str(totalmins);
    minutes = int2str(time);
    hours = int2str(totalhours);
    message = [totalmins ' minutes = ' hours ' hour and ' minutes ' minutes'];
else
    totalmins = int2str(totalmins);
    minutes = int2str(time);
    hours = int2str(totalhours);
    message = [totalmins ' minutes = ' hours ' hours and ' minutes ' minutes'];
end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% START OF AUTOGRADER FEEDBACK %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Your score is 4.1667 / 15.
% 
%  Test Case #1 - 0/2.5 - myTimeConversion(1)
% % Output 1/3 : Expected [double]; your code returned [char]
% % Output 2/3 : Expected [double]; your code returned [char]
% % Output 3/3 : Expected size = [1  32]; your code returned size = [1  31]
% 
%  Test Case #2 - 0.83333/2.5 - myTimeConversion(60)
% % Output 1/3 : Expected [double]; your code returned [char]
% % Output 2/3 : Expected [double]; your code returned [char]
% 
%  Test Case #3 - 0.83333/2.5 - myTimeConversion(151)
% % Output 1/3 : Expected [double]; your code returned [char]
% % Output 2/3 : Expected size = [1  1]; your code returned size = [1  2]
% % Output 2/3 : Expected [double]; your code returned [char]
% 
%  Test Case #4 - 0.83333/2.5 - myTimeConversion(181)
% % Output 1/3 : Expected [double]; your code returned [char]
% % Output 2/3 : Expected [double]; your code returned [char]
% 
%  Test Case #5 - 0.83333/2.5 - myTimeConversion(34)
% % Output 1/3 : Expected [double]; your code returned [char]
% % Output 2/3 : Expected size = [1  1]; your code returned size = [1  2]
% % Output 2/3 : Expected [double]; your code returned [char]
% 
%  Test Case #6 - 0.83333/2.5 - myTimeConversion(79)
% % Output 1/3 : Expected [double]; your code returned [char]
% % Output 2/3 : Expected size = [1  1]; your code returned size = [1  2]
% % Output 2/3 : Expected [double]; your code returned [char]
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% END OF AUTOGRADER FEEDBACK %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
