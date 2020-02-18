function primeFactors = primeFactorization(x,divisor,primeFactors)
if ~isa(x, 'double') || x <= 1
    disp("Integer to perform prime factorization on must be type 1x1 double greater tyah 1");
    return;
end
if ~isa(divisor, 'double') || divisor < 1
    disp("Divisor of x must be of type 1x1 double greater than 0")
    return;
end
if ~isa(primeFactors, 'double') && ~isempty(primeFactors)
    disp("primeFactors of x must be of type double unless empty");
    return;
end
persistent i;

if isempty(primeFactors)
    if x < divisor * divisor && isempty(i)
        disp("Divisor of x must be in the range (1, sqrt(x)]");
        return;
    end
end
if x == 1
    divisor = 2;
    primeFactors = primeFactors;
elseif mod(x, divisor) == 0
    i = 1;
    primeFactors(length(primeFactors) + 1) = divisor;
    primeFactors = primeFactorization(x / divisor, divisor, primeFactors);
else
    i = 1;
    divisor = divisor + 1;
    primeFactors = primeFactorization(x, divisor, primeFactors);
end
end

