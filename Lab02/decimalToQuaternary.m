function quaternary = decimalToQuaternary(decimal)
sum = 0;
power = 0;
solution = recurse(decimal);
    function answer = recurse(dec)    
    while dec ~= 0
        digit = dec - 10 * floor(dec / 10);
        if digit < 4
            sum = sum + digit * 10^power;
        elseif digit == 4
            sum = sum + 1 * 10^(power + 1);
        elseif digit == 5
            sum = sum + 1 * 10^(power + 1) + 1 * 10^(power);
        elseif digit == 6
            sum = sum + 1 * 10^(power + 1) + 2 * 10^(power);
        elseif digit == 7
            sum = sum + 1 * 10^(power + 1) + 3 * 10^(power);
        elseif digit == 8
            sum = sum + 2 * 10^(power + 1);
        elseif digit == 9
            sum = sum + 2 * 10^(power + 1) + 1 * 10^(power);
        end
        power = power + 1;
        dec = floor(dec / 10);
    end
    answer = sum;
    end
resum = recurse(sum);
if resum == sum
    arr = [0, 0, 0, 0, 0, 0, 0, 0];
    for i = 1:8
        digit = solution - 10 * floor(solution / 10);
        solution = floor(solution / 10);
        arr(9 - i) = digit;
    end
    quaternary = arr;

else
    quaternary = decimalToQuaternary(sum);
end

end