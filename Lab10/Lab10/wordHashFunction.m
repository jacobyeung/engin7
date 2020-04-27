function index = wordHashFunction(word,cap)
primes = [2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97];
N = length(word);
index = 0;
for i = 1:N
    index = index + double(word(i)) * primes(i)^i;
end
index = mod(index, cap);
if index == 0
    index = cap;
else
    index = index + 1;
end
end

