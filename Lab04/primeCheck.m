function result = primeCheck(x)
if x < 1
    disp("Invalid input, number must be positive integer");
end
persistent i;
if x == 1
    result = char('Non-Prime');
elseif x == 2
    result = char('Prime');
else
    if isempty(i)
        i = 2;
    elseif mod(i, 2) == 0
        i = i + 1;
    else
        i = i + 2;
    end
    if i > sqrt(x)
        result = char('Prime');
    elseif mod(x, i) == 0
        result = char('Non-Prime');
    else
        result = primeCheck(x);
    end
end
clear i;

end

