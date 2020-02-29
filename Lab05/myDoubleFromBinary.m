function [result] = myDoubleFromBinary(binary)
s = double(binary(1));
e11 = double(binary(2:12));
f52 = double(binary(13:end));
e = 0;
f = 0;
for i = 0:10
    e = e + e11(11 - i)*2^i;
end
for i = 1:52
    f = f + f52(i)*2^(-i);
end
if e == 0 && f ~= 0
    [result] = ((-1)^(s)) * (2^(1 - 1023)) * (1 + f);
elseif e == 0 && f == 0
    [result] = 0;
elseif e == 2047 && f == 0
    [result] = ((-1)^s)*Inf;
elseif e == 2047 && f ~= 0
    [result] = NaN;
else
    [result] = ((-1)^s) * (2^(e - 1023)) * (1 + f);
end

