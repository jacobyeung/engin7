%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                           Lab 01 Tester-Zipper                          % 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Clear out any variables
clear, clc;

% Use a compact output format for easier visual comparison with test cases
format compact; % you can switch back to default by typing "format loose"

% Lab name for labeling submission zip
lab = 'Lab01';

% List of function files to zip into submission zip
% You may edit this list if you wish to include other functions
files = {'myMathCalculations.m','myMean.m','myVar.m','myInterest.m'};
%% Test Problem 1

fprintf('\n********** Problem 1 **********\n')
fprintf('      myMathCalculations')
fprintf('\n*******************************\n')

fprintf('********* Test case 1 *********\n\n')
fprintf('Your results:\n')
[d1,d2,d3,d4,d5,d6,d7,d8,d9,d10] = myMathCalculations(-1/4,2,3,-7)
fprintf('\nThe correct results are:\n')
fprintf('d1 = 0.0400\n')
fprintf('d2 = 0.5774\n')
fprintf('d3 = 0.0123\n')
fprintf('d4 = 0.2430\n')
fprintf('d5 = -0.0354\n')
fprintf('d6 = -1.7246\n')
fprintf('d7 = -3.0038\n')
fprintf('d8 = -0.6970\n')
fprintf('d9 = 0.8262\n')
fprintf('d10 = 0.7781\n')
%% Test Problem 2

fprintf('\n********** Problem 2 **********\n')
fprintf('            myMean')
fprintf('\n*******************************\n')

fprintf('********* Test case 1 *********\n\n')
fprintf('Your results:\n')
[ave, abs_ave] = myMean(2,0,-5)
fprintf('\nThe correct results are:\n')
fprintf('ave = -1\n')
fprintf('ave_abs = 2.3333\n')
%% Test Problem 3

fprintf('\n********** Problem 3 **********\n')
fprintf('             myVar')
fprintf('\n*******************************\n')

fprintf('********* Test case 1 *********\n\n')
fprintf('Your results:\n')
[sigma2, abs_sigma2] = myVar(2,0,-5)
fprintf('\nThe correct results are:\n')
fprintf('sigma2 = 13\n')
fprintf('abs_sigma2 = 6.3333\n')
%% Test Problem 4
fprintf('\n********** Problem 4 **********\n')
fprintf('          myInterest')
fprintf('\n*******************************\n')

fprintf('********* Test case 1 *********\n\n')
fprintf('Your result:\n')
Saving = myInterest(0.03, 10000)
fprintf('\nThe correct result is:\n')
fprintf('Saving =\n    1.8009e+04\n')

%% Zip files

% Reset lab name and functions list to default if undefined for some reason
if ~exist('lab','var')
    lab = 'Lab01';
end
if ~exist('files','var')
    files = {'myMathCalculations.m','myMean.m','myVar.m','myInterest.m'};
end

fprintf('\nAttempting to zip lab files...\n')

% Search for lab files
found = -1*ones(1,length(files));
for n = 1:length(files)
    if ~exist(files{n},'file')
        fprintf(['WARNING: file ',files{n},' not found!\n']);
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
        fprintf('Successful creation of zip with all lab functions!\n');
    else
        fprintf('WARNING: One or more files was not found and will be missing from zip!\n')
        fprintf('You will get 0 credit for any function that is missing from your most recent zip upload!\n');
    end
catch exception
    % Failure output
    fprintf(['FAILURE: ' exception.message '\n']);
end