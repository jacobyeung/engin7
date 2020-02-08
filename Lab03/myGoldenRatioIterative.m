function ratio = myGoldenRatioIterative(m)
arr = 1:(m + 1);
arr(2) = 1;
for i = 3:(m + 1)
    arr(i) = arr(i - 1) + arr(i - 2);
end
ratio = arr(m + 1) / arr(m);
end

