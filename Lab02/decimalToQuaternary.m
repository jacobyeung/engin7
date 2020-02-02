function quaternary = decimalToQuaternary(decimal)
sum = [0, 0, 0, 0, 0, 0, 0, 0];
count = 8;
while decimal > 0
    remainder = mod(decimal, 4);
    sum(count) = remainder;
    decimal = (decimal - remainder) / 4;
    count = count - 1;
end
quaternary = sum;
end