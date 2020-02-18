function GCD = greatestCommonDivisor(a, b)
if ~isa(a, 'double') || ~isa(b, 'double')
    disp("Inputs must be a 1x1 double");
elseif a == 0 && b == 0
    disp("Both inputs cannot be 0");
elseif a < 0 || b < 0
    disp("Inputs must be greater than or equal to 0");
elseif b == 0
    GCD = a;
else
    GCD = greatestCommonDivisor(b, mod(a, b));
end

