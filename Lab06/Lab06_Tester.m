%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                           Lab 06 Tester-Zipper                          % 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Clear out any variables
clear, clc;

% Use a compact output format for easier visual comparison with test cases
format compact; % you can switch back to default by typing "format loose"

% Lab name for labeling submission zip
lab = 'Lab06';

name1 = 'linearEquationTest.m';
name2 = 'myBigOAnswers.m';
name3 = 'myLinearCom.m';
name4 = 'myPolyCom.m';
name5 = 'estimateTimeComplexity.m';


files = {name1,name2,name3,name4,name5};
%% Test Problem 1
fprintf('\n********** Problem 1 **********\n')
fprintf('          message = linearEquationTest(A,y)')
fprintf('\n*******************************\n')

fprintf('********* Test case 1 *********\n\n')
fprintf('Your result:\n')
A=[1 3 2; 2 1 1; -8 1 -1];
y=[1; 0; 1];
message = linearEquationTest(A,y)
fprintf('\nThe correct result is:\n message = \n')
fprintf('    ''Solution does not exist''\n')


fprintf('********* Test case 2 *********\n\n')
fprintf('Your result:\n')
A=[1 3 2; 2 1 1; 1 8 10];
y=[1; 0; 1];
message = linearEquationTest(A,y)
fprintf('\nThe correct result is:\n message = \n')
fprintf('    ''Solution exists and is unique''\n')

fprintf('********* Test case 3 *********\n\n')
fprintf('Your result:\n')
A=[1 3 2; 2 1 1; -8 1 -1];
y=[4; 3; -7];
message = linearEquationTest(A,y)
fprintf('\nThe correct result is:\n message = \n')
fprintf('    ''Solution exists but is not unique''\n')
%% Test Problem 2
fprintf('\n No test case for Problem 2\n')
%% Test Problem 3
fprintf('\n********** Problem 3 **********\n')
fprintf('          function [slope, intercept, fig] = myLinearCom(fn, n, choice)')
fprintf('\n*******************************\n')
fn= @(x) linear(x);
n=5000;
choice=true;
[slope, intercept, fig] = myLinearCom(fn, n, choice)
fprintf('\nThe correct result is:\n')
fprintf('\nYour slope and intercept will be various due to different computer.\n')
fprintf('Your fig will be Figure(n) with properties (n is the number of figure windows you open).')

%% Test Problem 4
fprintf('\n********** Problem 3 **********\n')
fprintf('          [coefficient,fig] = myPolyCom(fn,n)')
fprintf('\n*******************************\n')

fprintf('********* Test case 1 *********\n\n')
fn= @(x) quadratic(x);
n=2000;
[coefficient,fig] = myPolyCom(fn,n)
fprintf('\nThe correct result is:\n')
fprintf('\nYour coefficient will be various due to different computer.\n')
fprintf('Your fig will be Figure(n) with properties (n is the number of figure windows you open).')


fprintf('********* Test case 2 *********\n\n')
fn= @(x) cubic(x);
n=300;
[coefficient,fig] = myPolyCom(fn,n)
fprintf('\nThe correct result is:\n')
fprintf('\nYour coefficient will be various due to different computer.\n')
fprintf('Your fig will be Figure(n) with properties (n is the number of figure windows you open).')

%% Test Problem 5
fprintf('\n********** Problem 5 **********\n')
fprintf('             [complexity] = estimateTimeComplexity(fn,n)')
fprintf('\n*******************************\n')

fprintf('********* Test case 1 *********\n\n')
fprintf('Your results:\n')
fn= @(x) linear(x);
n=5000;
[complexity] = estimateTimeComplexity(fn,n)
fprintf('\nThe correct results are:\ncomplexity = \n')
fprintf('O(n)\n')

fprintf('********* Test case 1 *********\n\n')
fprintf('Your results:\n')
fn= @(x) linear(x);
n=5000;
[complexity] = estimateTimeComplexity(fn,n)
fprintf('\nThe correct results are:\ncomplexity = \n')
fprintf('''O(n)''\n')

fprintf('********* Test case 2 *********\n\n')
fprintf('Your results:\n')
fn= @(x) quadratic(x);
n=2000;
[complexity] = estimateTimeComplexity(fn,n)
fprintf('\nThe correct results are:\ncomplexity = \n')
fprintf('''O(n^2)''\n')
fprintf('********* Test case 3 *********\n\n')
fprintf('Your results:\n')
fn= @(x) cubic(x);
n=400;
[complexity] = estimateTimeComplexity(fn,n)
fprintf('\nThe correct results are:\ncomplexity = \n')
fprintf('''O(n^3)''\n')
fprintf('********* Test case 4 *********\n\n')
fprintf('Your results:\n')
fn= @(x) logarithm(x);
n=7000;
[complexity] = estimateTimeComplexity(fn,n)
fprintf('\nThe correct results are:\ncomplexity = \n')
fprintf('''O(log(n))''\n')

fprintf('********* Test case 5 *********\n\n')
fprintf('Your results:\n')
fn= @(x) myFArray(x);
n=30;
[complexity] = estimateTimeComplexity(fn,n)
fprintf('\nThe correct results are:\ncomplexity = \n')
fprintf('''O(exp(n))''\n')

% In this question, you can customer your own fn and n.
%% Zip files

% Reset lab name and functions list to default if undefined for some reason
if ~exist('lab','var')
    lab = 'Lab06';
end
if ~exist('files','var')
    files = {name1,name2,name3,name4,name5};
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