function F_m = myFArray(m)
if m == 1 | m == 2
    F_m = 1;
else
    F_m = myFArray(m-2) + myFArray(m-1);
end