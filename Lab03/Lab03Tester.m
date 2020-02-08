%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                           Lab 03 Tester-Zipper                          % 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Clear out any variables
clear, clc;

% Use a compact output format for easier visual comparison with test cases
format compact; % you can switch back to default by typing "format loose"

% Lab name for labeling submission zip
lab = 'Lab03';

name1 = 'collisionPrediction.m';
name2 = 'rentPrediction.m';
name3 = 'targetPractice.m';
name4 = 'myGoldenRatioIterative.m';
name5 = 'myFArray.m';
name6 = 'myGoldenRatioRecursive.m';
name7 = 'goldenRatioComputing.m';

files = {name1,name2,name3,name4,name5,name6,name7};
%% Test Problem 1

fprintf('\n********** Problem 1 **********\n')
fprintf('      collisionPrediction')
fprintf('\n*******************************\n')

fprintf('********* Test case 1 *********\n\n')
fprintf('Your results:\n')
t = collisionPrediction(1, 2, 10, 0.1)
fprintf('\nThe correct result is:\n')
fprintf('t = 3.3979\n')
%% Test Problem 2

fprintf('\n********** Problem 2 **********\n')
fprintf('            rentPrediction')
fprintf('\n*******************************\n')

fprintf('********* Test case 1 *********\n\n')
fprintf('Your results:\n')
rent=rentPrediction([1 0 1 1 0 0 1 1 0 1 0 1])
fprintf('\nThe correct results are:\n')
fprintf('rent = 4650\n')

fprintf('********* Test case 2 *********\n\n')
fprintf('Your results:\n')
rent=rentPrediction([1 1 1 1 1 1 1 0 0 1 0 1])
fprintf('\nThe correct results are:\n')
fprintf('rent = 5800\n')

%%
close all;
% Test Problem 3
fprintf('\n********** Problem 3 **********\n')
fprintf('          targetPractice')
fprintf('\n*******************************\n')

fprintf('********* Test case 1 *********\n\n')
fprintf('Manually type the first try, velocity: 15, angle: 45\n')
fprintf('Because you are 12.9358m away from target, which exceeds tol. You should be asked to give another velocity and angle.\n')
fprintf('Then Manually type the first try, velocity: 10, angle: 45\n')
[v, theta] = targetPractice(10, 0 , 1)
fprintf('\nThe above v and theta is your answer.\n')
fprintf('\nThe correct result is:\n')
fprintf('v = 10\n')
fprintf('theta = 45\n')
%% Test Problem 4

fprintf('\n********** Problem 4 **********\n')
fprintf('          myGoldenRatioIterative')
fprintf('\n*******************************\n')

fprintf('********* Test case 1 *********\n\n')
fprintf('Your results:\n')
ratio = myGoldenRatioIterative(10)
fprintf('\nThe correct result is:\n')
fprintf('ratio = 1.6182\n')
%% Test Problem 5
fprintf('\n********** Problem 5 **********\n')
fprintf('          myGoldenSpiralRecursive')
fprintf('\n*******************************\n')

fprintf('********* Test case 1 *********\n\n')
fprintf('Your results:\n')
F_k = myFArray(20)
fprintf('\nThe correct result is:\n')
fprintf('F_k = 6765\n')

fprintf('********* Test case 2 *********\n\n')
fprintf('Your results:\n')
ratio2 = myGoldenRatioRecursive(10)
fprintf('\nThe correct result is:\n')
fprintf('ratio2 = 1.6182\n')

fprintf('********* Test case 3 *********\n\n')
timeArrayGolden = goldenRatioComputing(20);
fprintf('Your plot should look like a line with a (slightly) positive slope and an expential plot')
fprintf('You might observe some fluctuation. This is because of the different hardware. ')
%% Zip files

% Reset lab name and functions list to default if undefined for some reason
if ~exist('lab','var')
    lab = 'Lab03';
end
if ~exist('files','var')
    files = {'collisionPrediction.m','rentPrediction.m','targetPractice.m',...
    'myGoldenRatioIterative.m','myFArray.m','myGoldenRatioRecursive.m','goldenRatioComputing.m'};
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

