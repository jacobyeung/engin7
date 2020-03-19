function [complexity] = estimateTimeComplexity(fn,n)
%% Array set up and prerunning the function
    close all, format compact;
    clear x, clear y
    
    x = [1:1:n]; % generate the array for fn input
    y = [1:n]; % array to store computation time

%% Prerunning function and timing function
%% ------Please do not change anything between those-------
    if strcmp(func2str(fn),'@(x,n,box)blackBox(x,n,box)')
        box = [];
        for i = prerun
            box = fn(i,n,box);
        end
        box = [];
   
        for i = x
            tic
            box = fn(i,n,box);
            y(i) = toc;
        end
    else
% -------Please do not change anything between those-------



        % write the code for recording computation time
 for i = 1:n
%      a = arrayBuilder(i);
     tic
     x = fn(i);
     y(i) = toc;
 end

    end % Do not delete this
x=[1:1:n]; % Do not change this line. You will be curve fitting using 
           % x = 1:n in all cases 
%% %%%%%%%%%%%% Polynomial complexity %%%%%%%%%%%% Log space %%%%%%%%%%% %%
lx = log10(x);
ly = log10(y);
one = polyfit(lx, ly, 1);
power = ([1 2 3] - one(1)).^2
deg = min(power);
lin = @(n) n(1) * lx + n(2);
r1 = 1 - (sum((ly - lin(one)).^2) / sum((ly - mean(ly)).^2));
global answer;
if deg == (1 - one(1))^2
    answer = 'O(n)';
elseif deg == (3 - one(1))^2
    answer = 'O(n^3)';
else
    answer = 'O(n^2)';
end

%% %%%%%%%%%% Exponential complexity %%%%%%%%% Linear Space %%%%%%%%%%%% %%
logy = log(y);
logone = polyfit(x, logy, 1);
logxL = @(n) n(1) * x + n(2);
r2 = 1 - (sum((logy - logxL(logone)).^2) / sum((logy - mean(logy)).^2));


%% %%%%%%%%% Logrithmic complexity %%%%%%%%%%% Linear Space %%%%%%%%%%%% %%
expy = exp(y);
expone = polyfit(x, expy, 1);
expxE = @(n) n(1) * x + n(2);
r3 = 1 - (sum((expy - expxE(expone)).^2) / sum((expy - mean(expy)).^2));
        
%% Determine the complexity of the program
all = cat(1, r1, r2, r3);
m = max(all);
if r1 == m
    complexity = answer;
elseif r2 == m
    complexity = 'O(exp(n))';
else
    complexity = 'O(log(n))';
end


end

        