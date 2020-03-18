function [choice] = estimateTimeComplexity(fn,n)
%% Array set up and prerunning the function
    close all, format compact;
    clear x, clear y
    
    x = % generate the array for fn input
    y = % array to store computation time

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
        
        
    end % Do not delete this
x=[1:1:n]; % Do not change this line. You will be curve fitting using 
           % x = 1:n in all cases 
%% %%%%%%%%%%%% Polynomial complexity %%%%%%%%%%%% Log space %%%%%%%%%%% %%


%% %%%%%%%%%% Exponential complexity %%%%%%%%% Linear Space %%%%%%%%%%%% %%


%% %%%%%%%%% Logrithmic complexity %%%%%%%%%%% Linear Space %%%%%%%%%%%% %%

        
%% Determine the complexity of the program

end

        