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
