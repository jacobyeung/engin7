function [add,charAdd,strOut,array,charArray] = dataTypeMatters(x,y)
add = x + y;
dec2bin(x);
dec2bin(y);
charAdd = double(num2str(x)) + double(num2str(y));
array = [x y];
charArray = [num2str(x) num2str(y)];
strOut = convertCharsToStrings(strcat(charArray));
end

