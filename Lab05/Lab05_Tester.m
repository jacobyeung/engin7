%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                           Lab 05 Tester-Zipper                          % 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Clear out any variables
clear, clc;

% Use a compact output format for easier visual comparison with test cases
format compact; % you can switch back to default by typing "format loose"

% Lab name for labeling submission zip
lab = 'Lab05';

name1 = 'searchGrade.m';
name2 = 'cheeseBoard.m';
name3 = 'berkelize.m';
name4 = 'myDoubleFromBinary.m';
name5 = 'comparePrecision.m';
name6 = 'scores_lab04.mat';


files = {name1,name2,name3,name4,name5,name6};
%% Test Problem 1
fprintf('\n********** Problem 1 **********\n')
fprintf('          [grade] = searchGrade(name,scores_lab04)')
fprintf('\n*******************************\n')

fprintf('********* Test case 1 *********\n\n')
fprintf('Your result:\n')
[grade] = searchGrade('carltonreese')
fprintf('\nThe correct result is:\n')
fprintf('86\n')

%% Test Problem 2
fprintf('\n********** Problem 2 **********\n')
fprintf('          path=cheeseBoard(current,prev_path)')
fprintf('\n*******************************\n')

fprintf('********* Test case 1 *********\n\n')
fprintf('Your result:\n')
path=cheeseBoard([1 1],[])
fprintf('\nThe correct result is:\n')
fprintf('15×8 char array\n    ''RRDRRDDD''\n    ''RRDRDRDD''\n    ''RRDDRRDD''\n    ''RRDDDDRR''\n    ''RDRRRDDD''\n')
fprintf('    ''RDRRDRDD''\n    ''RDRDRRDD''\n    ''RDRDDDRR''\n    ''DRRRRDDD''\n    ''DRRRDRDD''\n')
fprintf('    ''DRRDRRDD''\n    ''DRRDDDRR''\n    ''DDDRRDRR''\n    ''DDDRDRRR''\n    ''DDDDRRRR''\n')
fprintf('The order of the rows of the answer doesn''t metter.\n')
%% Test Problem 5
fprintf('Run script berkelized.m\n')
%% Test Problem 4
fprintf('\n********** Problem 4 **********\n')
fprintf('             [result] = myDoubleFromBinary(binary)')
fprintf('\n*******************************\n')
binary=logical(zeros(1,64));
binary(3:12)=logical(ones(1,10));
binary(14:15)=[true, true];
fprintf('********* Test case 1 *********\n\n')
fprintf('Your results:\n')
[result] = myDoubleFromBinary(binary)
fprintf('\nThe correct results are:\n')
fprintf('result = 1.3750\n')
%% Test Problem 4
fprintf('\n********** Problem 4 **********\n')
fprintf('             [result] = myDoubleFromBinary(binary)')
fprintf('\n*******************************\n')
binary=logical(zeros(1,64));
binary(3:12)=logical(ones(1,10));
binary(14:15)=[true, true];
fprintf('********* Test case 1 *********\n\n')
fprintf('Your results:\n')
[result] = myDoubleFromBinary(binary)
fprintf('\nThe correct results are:\n')
fprintf('result = 1.3750\n')
%% Test Problem 5
fprintf('\n********** Problem 5 **********\n')
fprintf('             [double_stats, int64_stats] = comparePrecision(binary)')
fprintf('\n*******************************\n')
binary=logical(zeros(1,64));
binary(3:12)=logical(ones(1,10));
binary(14:15)=[true, true];
fprintf('********* Test case 1 *********\n\n')
fprintf('Your results:\n')
[double_stats, int64_stats] = comparePrecision(binary);
double_stats(1)
double_stats(2)
double_stats(3)
int64_stats(1)
int64_stats(2)
int64_stats(3)
fprintf('\nThe correct results are:\n')
fprintf('ans=1.3750\nans=2.2204e-16\nans=1.7977e+308\nans=int64\n1\nans=int64\n1\nans=int64\n9223372036854775807\n')
%% Zip files

% Reset lab name and functions list to default if undefined for some reason
if ~exist('lab','var')
    lab = 'Lab05';
end
if ~exist('files','var')
    files = {name1,name2,name3,name4,name5,name6};
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