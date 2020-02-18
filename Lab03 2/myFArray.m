function F_k = myFArray(k)
if k == 1 || k == 2
    F_k = 1;
else
    F_k = myFArray(k - 1) + myFArray(k - 2);
end

