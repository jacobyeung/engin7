function [slope, intercept, fig] = myLinearCom(fn, n, choice)
fig = figure;
t = ones(2, 5000);
ele = [1:1:n];
for i = 1:n
    tic;
    x = fn(ele(i));
    t(2, i) = toc;
end
slopes = ele.' \ t.';
if choice == 0
    intercept = 0;
else
    intercept = slopes(2);
end
slope = slopes(2);
p1 = plot(ele, t(2, :), 'o');
hold on;
p2 = plot(slope * ele + intercept);
ylim([0, 8*10^(-6)]);
title('Linear fit for O(n) complexity');
xlabel('Number of times fn is called');
ylabel('Time Taken (s)');
set(fig, 'DefaultLegendAutoUpdate','off')
legend('Original Data', 'Best Fit');
end

