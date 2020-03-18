function [coefficient, fig] = myPolyCom(fn, n)
t = [1:n];
ele = [1:1:n];
for i = 1:n
    tic
    x = fn(ele(i));
    t(2, i) = toc;
end
two = polyfit(ele, t(2, :), 2);
square = @(n) n(1) * ele.*ele + n(2) * ele + n(3);
three = polyfit(ele, t(2, :), 3);
cube = @(n) n(1) * ele.*ele.*ele + n(2) * ele.*ele + n(3) * ele + n(4);

fig = figure;
plot(ele, t(2, :), 'o');
hold on;
plot(square(two));
plot(cube(three));
legend('Original Data', 'O(n^2)', 'O9n^3)');
two = cat(2, [0], two);
coefficient = cat(1, two, three);
end

