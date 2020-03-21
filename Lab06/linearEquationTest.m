function message = linearEquationTest(A,y)
if ~strcmp(class(A), "double")
    disp("Input matrix must be mxn double");
end
if ~strcmp(class(y), "double")
    disp("Input vector must be mx1 double");
end
a = rank(A);
ay = rank([A y]);
if a == ay
    if size(A, 2) == a
        message = 'Solution exists and is unique';
    else
        message = 'Solution exists but is not unique';
    end
else
    message = 'Solution does not exist';
end