function [errors,orders,fig] = compareIntError(f,interval,Ns,int_methods)
errors = ones(length(int_methods), length(Ns));
diff = interval(2) - interval(1);
tint = integral(f, interval(1), interval(2));
orders = ones(length(int_methods),1);
x = 1./Ns;
logx = log10(x);
fig = figure;
hold on;
for i = 1:length(int_methods)
    if contains(int_methods(i), 'left')
        for j = 1:length(Ns)
            inte = myRiemann(f, interval, Ns(j), 'left');
            errors(i, j) = abs(tint - inte);
        end
    elseif contains(int_methods(i), 'right')
        for j = 1:length(Ns)
            inte = myRiemann(f, interval, Ns(j), 'right');
            errors(i, j) = abs(tint - inte);
        end
    elseif contains(int_methods(i), 'midpoint')
        for j = 1:length(Ns)
            inte = myRiemann(f, interval, Ns(j), 'midpoint');
            errors(i, j) = abs(tint - inte);
        end
    elseif contains(int_methods(i), 'Simpson')
        for j = 1:length(Ns)
            inte = mySimpson(f, interval, Ns(j));
            errors(i, j) = abs(tint - inte);
        end
    elseif contains(int_methods(i), 'trapezoidal')
        for j = 1:length(Ns)
            x = [interval(1):diff/Ns(j):interval(2)];
            y = f(x);
            inte = trapz(x, y);
            errors(i, j) = abs(tint - inte);
        end
    end
    logerr = log10(errors(i, :));
    p = polyfit(logx, logerr, 1);
    orders(i) = p(1);
    y = polyval(p, logx);
    loglog(logx, y);
end
legend(int_methods);
xlabel('log-dx');
ylabel('log-error');
title("Error of Numerical Integration Methods");
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% START OF AUTOGRADER FEEDBACK %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Your score is 19.2667 / 20.
% 
%  Test Case #1 - 3.6667/4
% % Output 2/3 : Size was transposed. This has been corrected for at 25% score reduction.
% 
%  Test Case #2 - 4/4
% 
%  Test Case #3 - 3.6667/4
% % Output 2/3 : Size was transposed. This has been corrected for at 25% score reduction.
% 
%  Test Case #4 - 3.6667/4
% % Output 2/3 : Size was transposed. This has been corrected for at 25% score reduction.
% 
%  Test Case #5 - 3.6667/4
% % Output 2/3 : Size was transposed. This has been corrected for at 25% score reduction.
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% END OF AUTOGRADER FEEDBACK %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
