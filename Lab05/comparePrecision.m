function [double_stats, int64_stats] = comparePrecision(binary)
d = myDoubleFromBinary(binary);
i = int64(d);
binary(64) = 1 - binary(64);
d2 = myDoubleFromBinary(binary);
d_precision = abs(d2 - d);
binary(13) = 1 - binary(13);
binary(64) = 1 - binary(64);
d3 = myDoubleFromBinary(binary);
i2 = int64(d3);
i_precision = abs(i2 - i);
maxVal = ones(1, 64);
maxVal(1) = 0;
maxVal(12) = 0;
dMax = myDoubleFromBinary(maxVal);
iMax = int64(dMax);
double_stats = [d d_precision dMax];
int64_stats = [i i_precision iMax];
end

