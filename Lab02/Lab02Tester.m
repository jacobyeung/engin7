%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                           Lab 02 Tester-Zipper                          % 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Clear out any variables
clear, clc;

% Use a compact output format for easier visual comparison with test cases
format compact; % you can switch back to default by typing "format loose"

% Lab name for labeling submission zip
lab = 'Lab02';

% List of function files to zip into submission zip
% You may edit this list if you wish to include other functions
files = {'cellConcatenate.m','dataTypeMatters.m','decimalToQuaternary.m',...
    'mathOperation.m','myArrayAccessTimer.m','myTimeConversion.m','recoverVector.m',...
    'rotateVector.m','timeAddition.m'};
%% Test Problem 1

fprintf('\n********** Problem 1 **********\n')
fprintf('      mathOperation')
fprintf('\n*******************************\n')

fprintf('********* Test case 1 *********\n\n')
fprintf('Your results:\n')
y = mathOperation(3)
fprintf('\nThe correct result is:\n')
fprintf('y = 12\n')
%% Test Problem 2

fprintf('\n********** Problem 2 **********\n')
fprintf('            timeAddition')
fprintf('\n*******************************\n')

fprintf('********* Test case 1 *********\n\n')
fprintf('Your results:\n')
input=ones(1,3);
for i = 1 : 3
    output=timeAddition(input(i))
end
fprintf('\nThe correct results are:\n')
fprintf('output = 2\n')
fprintf('output = 3\n')
fprintf('output = 4\n')
%% Test Problem 3

fprintf('\n********** Problem 3 **********\n')
fprintf('             decimalToQuaternary')
fprintf('\n*******************************\n')

fprintf('********* Test case 1 *********\n\n')
fprintf('Your results:\n')
quaternary = decimalToQuaternary(65323)
fprintf('\nThe correct result is:\n')
fprintf('quaternary = 3     3     3     3     0     2     2     3\n')
%% Test Problem 4
fprintf('\n********** Problem 4 **********\n')
fprintf('          rotateVector')
fprintf('\n*******************************\n')

fprintf('********* Test case 1 *********\n\n')
fprintf('Your result:\n')
u_rotated = rotateVector([3;4], pi*0.75)
fprintf('\nThe correct result is:\n')
fprintf('u_rotated =\n    -4.9497\n    -0.7071\n')
%% Test Problem 5
fprintf('\n********** Problem 5 **********\n')
fprintf('          recoverVector')
fprintf('\n*******************************\n')

fprintf('********* Test case 1 *********\n\n')
fprintf('Your result:\n')
u_recovered = recoverVector([3;4], pi*0.75)
fprintf('\nThe correct result is:\n')
fprintf('u_recovered =\n    0.7071\n    -4.9497\n')
%% Test Problem 6
fprintf('\n********** Problem 6 **********\n')
fprintf('          dataTypeMatters')
fprintf('\n*******************************\n')

fprintf('********* Test case 1 *********\n\n')
fprintf('Your result:\n')
[add,charAdd,strOut,array,charArray] = dataTypeMatters(5,9)
fprintf('\nThe correct results are:\n')
fprintf('add = 14\n')
fprintf('charAdd = 110\n')
fprintf('strOut = "59"\n')
fprintf('array = 5    9\n')
fprintf('charArray = ''59''\n')
%% Test Problem 7
fprintf('\n********** Problem 7 **********\n')
fprintf('          myTimeConversion')
fprintf('\n*******************************\n')

fprintf('\n********* Test case 1 *********\n\n')
fprintf('Your result:\n')
[hours, minutes, message] = myTimeConversion(151)
fprintf('\nThe correct results are:\n')
fprintf('hours = 2\n')
fprintf('minutes = 31\n')
fprintf('''151 minutes = 2 hours and 31 minutes''\n')
fprintf('\n********* Test case 2 *********\n')
fprintf('Your result:\n')
[hours, minutes, message] = myTimeConversion(181)
fprintf('\nThe correct results are:\n')
fprintf('hours = 3\n')
fprintf('minutes = 1\n')
fprintf('''181 minutes = 3 hours and 1 minute''\n')
fprintf('\n********* Test case 3 *********\n')
fprintf('Your result:\n')
[hours, minutes, message] = myTimeConversion(1)
fprintf('\nThe correct results are:\n')
fprintf('hours = 0\n')
fprintf('minutes = 1\n')
fprintf('''1 minute = 0 hours and 1 minute''\n')
%% Test Problem 8
fprintf('\n********** Problem 8 **********\n')
fprintf('          cellConcatenate')
fprintf('\n*******************************\n')

fprintf('********* Test case 1 *********\n\n')
fprintf('Your result:\n')
C1 = {1, 2, 3};
C2={'text', rand(5,10,2), {11; 22; 33}};
[C_joined, C_nested] = cellConcatenate(C1, C2)
fprintf('\nThe correct results are:\n')
fprintf('C_joined =\n 1×6 cell array \n{[1]}    {[2]}    {[3]}    {''text''}    {5×10×2 double}    {3×1 cell}\n')
fprintf('C_nested = \n 1×2 cell array \n{1×3 cell}    {1×3 cell}\n')
%% Test Problem 9
fprintf('\n********** Problem 9 **********\n')
fprintf('          myArrayAccessTimer')
fprintf('\n*******************************\n')

fprintf('********* Test case 1 *********\n\n')
fprintf('Your result:\n')
matrix=ones(1000,1000);
[time1, time2, time3] = myArrayAccessTimer(matrix)
fprintf('\nYour time1, time2 and time3 will be various due to different computer. But they should be in similar order of magnitude.\n')
fprintf('For example, 1e-4 to 1e-6\n')
%% Zip files

% Reset lab name and functions list to default if undefined for some reason
if ~exist('lab','var')
    lab = 'Lab02';
end
if ~exist('files','var')
    files = {'cellConcatenate.m','dataTypeMatters.m','decimalToQuaternary.m',...
    'mathOperation.m','myArrayAccessTimer.m','myTimeConversion.m','recoverVector.m',...
    'rotateVector.m','timeAddition.m'};
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