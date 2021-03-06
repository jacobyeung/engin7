%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                           Lab 09 Tester-Zipper                          % 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Clear out any variables
clear, clc;

% Use a compact output format for easier visual comparison with test cases
format compact; % you can switch back to default by typing "format loose"

% Lab name for labeling submission zip
lab = 'Lab09';

name1 = 'myEuler.m';
name2 = 'myCompartment.m';
name3 = 'sid.m';
name4 = 'pointerVerify.m';
name5 = 'myWordNode.m';
name6 = 'wordList.m';

files = {name1,name2,name3,name4,name5,name6};

%% Test Problem 1.1
fprintf('\n********** Problem 1.1 **********\n')
fprintf('          function [y] = myEuler(f,tspan,y0,N)')
fprintf('\n*******************************\n')

fprintf('********* Test case 1 *********\n\n')
fprintf('Your result:\n')
y = myEuler(@(t,y) 2*sin(t)-.5*y,[0,5],3,5)
fprintf('\nThe correct result is:\n y = \n     3.0000    1.5000    2.4329    3.0351    1.7998   -0.6137\n')

%% Test Problem 1.2
fprintf('\n********** Problem 1.2 **********\n')
fprintf('          [S, I, R, fig] = myCompartment(S_init, I_init, R_init, tf, mu, lambda)')
fprintf('\n*******************************\n')
fprintf('********* Test case 1 *********\n\n')
fprintf('Your result:\n')
[S, I, R, fig1] = myCompartment(20000, 0, 0, 10, 0.95, 0.9);
%fig2 = openfig('myCompartment.fig')
%fprintf('\nYour plot(figure1) should be same as figure2.')

%% Test Problem 2.1
fprintf('\n********** Problem 2.1 **********\n')
fprintf('          class sid')
fprintf('\n*******************************\n')

fprintf('********* Test case 1 *********\n\n')
fprintf('Your result:\n')
Student = sid();
Student.name = "e7";
Student.number = 123
fprintf('\nThe correct result is:\n Student = \n  sid with properties:\n      name: "e7"\n    number: 123\n');

fprintf('\n********* Test case 2 *********\n\n')
changeNumber(Student, 456)
Student
fprintf('\nThe correct result is:\n Student = \n  sid with properties:\n      name: "e7"\n    number: 456\n');
%% Test Problem 2.2
fprintf('\n********** Problem 2.2 **********\n')
fprintf('          function result = pointerVerify(sid1)')
fprintf('\n*******************************\n')

fprintf('********* Test case 1 *********\n\n')
fprintf('Your result:\n')
Student = sid();
Student.name = "e7";
Student.number = 123;
result = pointerVerify(Student)
fprintf('\nresult:\n     1\n')
fprintf('********* Test case 2 *********\n\n')
fprintf('Your result:\n')
Student2 = struct('name',"e7",'number',123);
result = pointerVerify(Student2)
fprintf('\nresult:\n     2\n')


%% Test Problem 3
% Run this each time you want to test the individual functions
clear list, clc
text = {'the','cat','and','the','dog'};
list = wordList;
for i = 1:5
    newNode = myWordNode;
    newNode.word = text{i};
    newNode.occurrences = 1;
    list.add(newNode);
end
%%
fprintf('\n********** Problem 3.1 **********\n\n')
fprintf('********* Test case 1 create node *********\n')
fprintf('Your result:\n')
node = myWordNode
fprintf('\nThe correct result is: \nnode = \n myWordNode with properties: \n \n           word: [] \n    occurrences: [] \n           prev: [0x0 myWordNode] \n           next: [0x0 myWordNode] \n')

fprintf('\n******* Test case 2 - getUnique function ************')
fprintf('\n****************** list.getUnique *******************\n')
fprintf('Your result:\n')
list.getUnique 
fprintf('\nThe correct result is:\nans = \n     4 \n')

fprintf('\n******* Test case 3 - getTotal function ************')
fprintf('\n****************** list.getTotal *******************\n')
fprintf('Your result:\n')
list.getTotal
fprintf('\nThe correct result is:\nans = \n     5 \n')

fprintf('\n******* Test case 4 - printList function ************')
fprintf('\n****************** list.printList *******************\n')
fprintf('Your result:\n')
list.printList
fprintf('\nThe correct result is:\nans = \n  1x4 cell array \n    {''and''}    {''cat''}    {''dog''}    {''the''} \n')

fprintf('\n******* Test case 5 - wordFrequency function ************')
fprintf('\n*************** 5a - list.wordFrequency *****************\n')
fprintf('Your result:\n')
list.wordFrequency
fprintf('\nThe correct result is:\nans = \n     1     1     1     2 \n') 
fprintf('\n************ 5a - list.wordFrequency(''the'') *************\n')
fprintf('Your result:\n')
list.wordFrequency('the')
fprintf('\nThe correct result is:\nans = \n     2      \n') 

fprintf('\n******* Test case 6 - relativeFreq function ************')
fprintf('\n*************** 6a - list.relativeFreq *****************\n')
fprintf('Your result:\n')
list.relativeFreq
fprintf('\nThe correct result is:\nans = \n    0.2000    0.2000    0.2000    0.4000       \n') 
fprintf('\n*********** 6b - list.relativeFreq(''and'') **************\n')
fprintf('Your result:\n')
list.relativeFreq('and')
fprintf('\nThe correct result is:\nans = \n    0.2000 \n') 

fprintf('\n******* Test case 7 - retrieveWord function ************')
fprintf('\n************** list.retrieveWord(''the'') ****************\n')
fprintf('Your result:\n')
list.retrieveWord('the')
fprintf('\nThe correct result is: \nans = \n myWordNode with properties: \n \n           word: ''the'' \n    occurrences: 2 \n           prev: [0x0 myWordNode] \n           next: [0x0 myWordNode] \n')

fprintf('\n********** Test case 8a - removeWord function *************')
fprintf('\n*********** head(a) - list.removeWord(''and'') **************\n')
fprintf('Your result:\n')
list.removeWord('and')
fprintf('\nThe correct result is: \nans = \n myWordNode with properties: \n \n           word: ''and'' \n    occurrences: 1 \n           prev: [0x0 myWordNode] \n           next: [0x0 myWordNode] \n')
fprintf('\n***************** head(b) - list.head ********************\n')
fprintf('Your result:\n')
list.head
fprintf('\nThe correct result is: \nans = \n myWordNode with properties: \n \n           word: ''cat'' \n    occurrences: 1 \n           prev: [0x0 myWordNode] \n           next: [1x1 myWordNode] \n')

fprintf('\n********** Test case 8b - removeWord function *************')
fprintf('\n********** middle(a) - list.removeWord(''dog'') *************\n')
fprintf('Your result:\n')
list.removeWord('dog')
fprintf('\nThe correct result is: \nans = \n myWordNode with properties: \n \n           word: ''dog'' \n    occurrences: 1 \n           prev: [0x0 myWordNode] \n           next: [0x0 myWordNode] \n')
fprintf('\n**************** middle(b) - list.head ********************\n')
fprintf('Your result:\n')
list.head.next
fprintf('\nThe correct result is: \nans = \n myWordNode with properties: \n \n           word: ''the'' \n    occurrences: 2 \n           prev: [1x1 myWordNode] \n           next: [0x0 myWordNode] \n')

fprintf('\n********* Test case 8c - removeWord function ************')
fprintf('\n********** tail(a) - list.removeWord(''dog'') *************\n')
fprintf('Your result:\n')
list.removeWord('the')
fprintf('\nThe correct result is: \nans = \n myWordNode with properties: \n \n           word: ''the'' \n    occurrences: 2 \n           prev: [0x0 myWordNode] \n           next: [0x0 myWordNode] \n')
fprintf('\n**************** tail(b) - list.head ********************\n')
fprintf('Your result:\n')
list.head
fprintf('\nThe correct result is: \nans = \n myWordNode with properties: \n \n           word: ''cat'' \n    occurrences: 1 \n           prev: [0x0 myWordNode] \n           next: [0x0 myWordNode] \n')
fprintf('\n**************** tail(c) - list.tail ********************\n')
fprintf('Your result:\n')
list.tail
fprintf('\nThe correct result is: \nans = \n myWordNode with properties: \n \n           word: ''cat'' \n    occurrences: 1 \n           prev: [0x0 myWordNode] \n           next: [0x0 myWordNode] \n')

%% Zip files

% Lab name
lab = 'Lab09';

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

