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

