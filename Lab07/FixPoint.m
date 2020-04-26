function fValue = FixPoint(fh, initialGuess, tolerance)
rootValue = initialGuess
fValue = fh(rootValue)
while abs(rootValue - fValue) > tolerance
    rootValue = fValue;
    fValue = fh(rootValue)
end
end
