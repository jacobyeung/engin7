%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                           Lab 04 Tester-Zipper                          % 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Clear out any variables
clear, clc;

% Use a compact output format for easier visual comparison with test cases
format compact; % you can switch back to default by typing "format loose"

% Lab name for labeling submission zip
lab = 'Lab04';

name1 = 'createTable.m';
name2 = 'transition.m';
name3 = 'runTuring.m';
name4 = 'primeCheck.m';
name5 = 'primeFactorization.m';
name6 = 'greatestCommonDivisor.m';


files = {name1,name2,name3,name4,name5,name6};
%% Test Problem 1
fprintf('\n********** Problem 1 **********\n')
fprintf('          anbncn_table = createTable()')
fprintf('\n*******************************\n')

anbncn_table = createTable();
fprintf('********* Test case 1 *********\n\n')
fprintf('Your result:\n')
disp(anbncn_table{2,2});
fprintf('\nThe correct result is:\n')
fprintf('q1,X,R\n')

fprintf('********* Test case 2 *********\n\n')
fprintf('Your result:\n')
disp(anbncn_table{4,3});
fprintf('\nThe correct result is:\n')
fprintf('q2,b,R\n')

fprintf('********* Test case 3 *********\n\n')
fprintf('Your result:\n')
disp(anbncn_table{6,7});
fprintf('\nThe correct result is:\n')
fprintf('q4,Z,R\n')
%% Test Problem 2
fprintf('\n********** Problem 2 **********\n')
fprintf('          transition')
fprintf('This test will call your function createTable')
fprintf('\n*******************************\n')

anbncn_table = createTable();
fprintf('********* Test case 1 *********\n\n')
fprintf('Your result:\n')
[new_state,new_value,move]=transition(anbncn_table,'q0','a')
fprintf('\nThe correct results are:\n')
fprintf('new_state = ''q1''\n')
fprintf('new_value = ''X''\n')
fprintf('move = ''R''\n')

fprintf('********* Test case 2 *********\n\n')
fprintf('Your result:\n')
[new_state,new_value,move]=transition(anbncn_table,'q0','b')
fprintf('\nThe correct results are:\n')
fprintf('new_state = ''q0''\n')
fprintf('new_value = ''b''\n')
fprintf('move = ''0''\n')
%% Test Problem 3
fprintf('\n********** Problem 3 **********\n')
fprintf('          runTuring')
fprintf('\n*******************************\n')

fprintf('********* Test case 1 *********\n\n')
fprintf('Your result:\n')
output = runTuring('aabbccB')
fprintf('\nThe correct result is:\n')
fprintf('output=\n logical\n 1\n')

fprintf('********* Test case 2 *********\n\n')
fprintf('Your result:\n')
output = runTuring('aaBbbccB')
fprintf('\nThe correct result is:\n')
fprintf('output=\n logical\n 0\n')

fprintf('********* Test case 3 *********\n\n')
fprintf('Your result:\n')
output = runTuring('BBBBB')
fprintf('\nThe correct result is:\n')
fprintf('output=\n logical\n 0\n')

fprintf('********* Test case 4 *********\n\n')
fprintf('Your result:\n')
output = runTuring('ccaabbB')
fprintf('\nThe correct result is:\n')
fprintf('output=\n logical\n 0\n')

fprintf('********* Test case 5 *********\n\n')
fprintf('Your result:\n')
output = runTuring('aaaabbbbccccBB')
fprintf('\nThe correct result is:\n')
fprintf('output=\n logical\n 1\n')
%% Test Problem 4

fprintf('\n********** Problem 4 **********\n')
fprintf('             primeCheck')
fprintf('\n*******************************\n')

fprintf('********* Test case 1 *********\n\n')
fprintf('Your results:\n')
result = primeCheck(2)
fprintf('\nThe correct results are:\n')
fprintf('result = ''Prime''\n')

fprintf('********* Test case 2 *********\n\n')
fprintf('Your results:\n')
result = primeCheck(547*2)
fprintf('\nThe correct results are:\n')
fprintf('result =''Non-Prime''\n')

fprintf('********* Test case 3 *********\n\n')
fprintf('Your results:\n')
result = primeCheck(376787)
fprintf('\nThe correct results are:\n')
fprintf('result =''Prime''\n')
%% Test Problem 5

fprintf('\n********** Problem 5 **********\n')
fprintf('             primeFactorization')
fprintf('\n*******************************\n')

fprintf('********* Test case 1 *********\n\n')
fprintf('Your results:\n')
result = primeFactorization(547,2,[])
fprintf('\nThe correct results are:\n')
fprintf('result = 547\n')

fprintf('********* Test case 2 *********\n\n')
fprintf('Your results:\n')
result = primeFactorization(547*2,2,[])
fprintf('\nThe correct results are:\n')
fprintf('result =2   547\n')
%% Test Problem 6

fprintf('\n********** Problem 6 **********\n')
fprintf('             greatestCommonDivisor')
fprintf('\n*******************************\n')

fprintf('********* Test case 1 *********\n\n')
fprintf('Your results:\n')
GCD = greatestCommonDivisor(547*13,547)
fprintf('\nThe correct results are:\n')
fprintf('GCD = 547\n')

fprintf('********* Test case 2 *********\n\n')
fprintf('Your results:\n')
GCD = greatestCommonDivisor(10007,500)
fprintf('\nThe correct results are:\n')
fprintf('GCD = 1\n')

fprintf('********* Test case 3 *********\n\n')
fprintf('Your results:\n')
GCD = greatestCommonDivisor(5,0)
fprintf('\nThe correct results are:\n')
fprintf('GCD = 5\n')
%% Zip files

% Reset lab name and functions list to default if undefined for some reason
if ~exist('lab','var')
    lab = 'Lab04';
end
if ~exist('files','var')
    files = {'createTable.m','transition.m','runTuring.m',...
    'primeCheck.m','primeFactorization.m','greatestCommonDivisor.m'};
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
