function timeArrayGolden = goldenRatioComputing(n)
timeArray = [1:n; 1:n]
for i = 1:n
    tic
    myGoldenRatioIterative(i);
    timeArray(1, i) = toc;
    tic
    myGoldenRatioRecursive(i);
    timeArray(2, i) = toc;
end
x = 1:n;
y = timeArray;
plot(x, y);
timeArrayGolden = timeArray;
end

