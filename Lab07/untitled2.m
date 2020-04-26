fh = @(x) -x^(0.5) + 10;
initialGuess = 2.0;
tolerance = 1e-6;
root = FixPoint(fh, initialGuess, tolerance)