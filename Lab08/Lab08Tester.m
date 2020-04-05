%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                           Lab 08 Tester-Zipper                          % 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Clear out any variables
clear, clc;

% Use a compact output format for easier visual comparison with test cases
format compact; % you can switch back to default by typing "format loose"

% Lab name for labeling submission zip
lab = 'Lab08';

name1 = 'myDerivative.m';
name2 = 'isFDMethodExact.m';
name3 = 'myRiemann.m';
name4 = 'mySimpson.m';
name5 = 'compareIntError.m'
name6 = 'myCurve.m';

files = {name1,name2,name3,name4,name5};

%% Test Problem 1.1
fprintf('\n********** Problem 1.1 **********\n')
fprintf('          function [derivative] = myDerivative(y,dx,n,method)')
fprintf('\n*******************************\n')

fprintf('********* Test case 1 *********\n\n')
fprintf('Your result:\n')
[derivative] = myDerivative([.25,1,3,2,0],.25,1,'central')
fprintf('\nThe correct result is:\n derivative = \n     5.5000    2.0000   -6.0000\n')

%% Test Problem 1.2
fprintf('\n********** Problem 1.2 **********\n')
fprintf('          function [isExact,exact_val,fd_approx] = isFDMethodExact(p,x,method)')
fprintf('\n*******************************\n')

fprintf('********* Test case 1 *********\n\n')
fprintf('Your result:\n')
[isExact,exact_val,fd_approx] = isFDMethodExact([3,2,1],0:.3:1.5,'1stD-forward')
fprintf('\nThe correct result is:\nisExact = \n     logical\n    0\n')
fprintf('exact_val = \n     3.8000    5.6000    7.4000    9.2000\n')
fprintf('fd_approx = \n     4.7000    6.5000    8.3000   10.1000\n')

fprintf('********* Test case 2 *********\n\n')
fprintf('Your result:\n')
[isExact,exact_val,fd_approx] = isFDMethodExact([3,2,1],0:.3:1.5,'1stD-central')
fprintf('\nThe correct result is:\nisExact = \n     logical\n    1\n')
fprintf('exact_val = \n     3.8000    5.6000    7.4000    9.2000\n')
fprintf('fd_approx = \n     3.8000    5.6000    7.4000    9.2000\n')



%% Test Problem 2.1
fprintf('\n********** Problem 2.1 **********\n')
fprintf('          [derivative] = myDerivative(D,dx,n,method)')
fprintf('\n*******************************\n')

fprintf('********* Test case 1 *********\n\n')
fprintf('Your result:\n')
[area_under_curve] = myRiemann(@sin,[0 pi],10,'left')
fprintf('\nThe correct result is:\n area_under_curve = \n     1.9835\n')


%% Test Problem 2.2
fprintf('\n********** Problem 2.2 **********\n')
fprintf('          function [integral] = mySimpson(f,interval,N)')
fprintf('\n*******************************\n')

fprintf('********* Test case 1 *********\n\n')
fprintf('Your result:\n')
[area_under_curve] = mySimpson(@sin,[0 pi],10)
fprintf('\nThe correct result is:\n area_under_curve = \n    2.0001\n')



%% Test Problem 2.3
fprintf('\n********** Problem 2.3 **********\n')
fprintf('          function [errors,orders,fig] = compareIntError(f,interval,Ns,int_methods)')
fprintf('\n*******************************\n')

fprintf('********* Test case 1 *********\n\n')
fprintf('Your result:\n')
[errors,orders,fig] = compareIntError(@sin,[0,2*pi/3],10.^(1:5),{'left-Riemann','midpoint-Riemann','trapezoidal'});
errors
orders

fprintf('\nThe correct result is:\n errors = \n     0.096177    0.0091238   0.00090745   9.0695e-05   9.0691e-06\n   0.0027451   2.7416e-05   2.7416e-07   2.7416e-09   2.7421e-11\n   0.0054871   5.4832e-05   5.4831e-07   5.4831e-09   5.4833e-11\n')
fprintf('orders = \n     1.0054       2.0001       2.0001\n')
dispPlotDataLengths(fig);


%% Test Problem 3
fprintf('\n********** Problem 3 **********\n')
fprintf('          function [edges]=myCurve(mu,sigma,rate)')
fprintf('\n*******************************\n')

fprintf('********* Test case 1 *********\n\n')
fprintf('Your result:\n')
[edges]=myCurve(75,10,[0.15 0.3 0.4 0.15])
fprintf('\nThe correct result is:\n edges = \n    56.9000   69.9000   81.4000\n')



    
%% Zip files

% Lab name
lab = 'Lab08';

% List of function files to zip into submission zip
% You may edit this list if you wish to include other functions
files = {name1,name2,name3,name4,name5,name6};
disp('Zipping...')

% Search for lab files
found = -1*ones(1,length(files));
for n = 1:length(files)
    if ~exist(files{n},'file')
        disp(['WARNING: ',files{n},' not found!']);
    else
        found(n) = n;
    end
end
found = found(found > 0);
try
    % Zip all files that were found
    zip(lab,files(found));
    
    % Success/Warning output
    if length(found) == length(files)
        disp('Successful creation of zip with all lab functions!');
    else
        disp('WARNING: One or more files was not found and will be missing from zip!')
        disp('You will get 0 credit for any function that is missing from your most recent zip upload!');
    end
catch exception
    % Failure output
    disp(['FAILURE: ' exception.message '']);
end

%% function to get the number of data points from plots within a figure
function dispPlotDataLengths(fig)
    if ~isa(fig,'matlab.ui.Figure')
        disp('fig is not a figure handle!');
        return;
    end
    found = 0;
    axes = fig.Children;
    for i = 1:length(axes)
        if isa(axes(i),'matlab.graphics.axis.Axes')
            plots = axes(i).Children;
            for j = 1:length(plots)
                if isa(plots(j),'matlab.graphics.chart.primitive.Line')
                    found = found + 1;
                    disp(['Plot ' num2str(found) ': ' num2str(length(plots(j).XData)) ' data points']);
                end
            end
        end
    end
    
    if found == 0
        disp('No plot data was found within figure!');
    end
end