function values = arrayBuilder(fn,maxRuns)
    if strcmp(func2str(fn),'@(x)primeCheck(x)')
        prims = primes(floor(maxRuns^2*1.1));
        values = zeros(1,maxRuns);
        for i = 1:maxRuns
            diff = prims - i^2;
            index = find(abs(diff) == min(abs(diff)),1);
            values(i) = prims(index);
        end
    else
       % disp('You have chosen something we have not defined. Use the default = 1:n')
        values = 1:maxRuns;
end
