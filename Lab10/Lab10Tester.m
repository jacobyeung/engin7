%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                           Lab 10 Tester-Zipper                          % 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Clear out any variables
clear, clc;

% Use a compact output format for easier visual comparison with test cases
format compact; % you can switch back to default by typing "format loose"

% Lab name for labeling submission zip
lab = 'Lab10';

name1 = 'wordHashFunction.m';
name2 = 'wordHashTable.m';
name3 = 'compareStorage.m';
name4 = 'minHeap.m';

files = {name1,name2,name3,name4};

%% Test Problem 1.2 - wordHashFunction
fprintf('\n**************** Problem 1.2 ****************\n')
fprintf('************ Test case 1 - MATLAB ***********\n')
fprintf('Your result:\n')
index = wordHashFunction('MATLAB', 17)
fprintf('\nThe correct result is:\n idnex = \n     7\n')

fprintf('\n************ Test case 2 - Matlab ***********\n')
fprintf('Your result:\n')
index = wordHashFunction('Matlab', 17)
fprintf('\nThe correct result is:\n idnex = \n     2\n')

fprintf('\n******** Test case 3 - recommendation *******\n')
fprintf('Your result:\n')
index = wordHashFunction('recommendation', 17)
fprintf('\nThe correct result is:\n idnex = \n     4\n')

%% Test Problem 1.3 - wordHashTable (initializing table)
fprintf('\n**************** Problem 1.3 ****************\n')
fprintf('***************** Test case 1 ***************\n')
fprintf('Your result:\n')
example = wordHashTable
fprintf('\nThe correct result is:\nexample = \n  wordHashTable with properties: \n         buckets: [] \n        capacity: []\n       currentFR: []\n    maxFillRatio: []\n    hashFunction: []\n      totalWords: 0\n     uniqueWords: 0\n')

%% Test Problem 1.4 - createTable
fprintf('\n******************* Problem 1.4 *******************\n')
fprintf('******************* Test case 1 *******************\n')
fprintf('Your result:\n')
example.createTable(45,0.75,@wordHashFunction)
example
fprintf('\nThe correct result is:\nexample = \n  wordHashTable with properties: \n         buckets: {1x45 cell} \n        capacity: 45\n       currentFR: []\n    maxFillRatio: 0.7500\n    hashFunction: @wordHashFunction\n      totalWords: 0\n     uniqueWords: 0\n')

%% Test Problem 1.5 - NEEDS TO BE RUN BEFORE EACH OF FOLLOWING CASES
fprintf('\n********************* Problem 1.5 ********************\n')
fprintf('**************** Test case 1 - insert ****************\n')
fprintf('Your result:\n')
clear example
example = wordHashTable;
example.createTable(10,0.75,@wordHashFunction)
example.insertWord('apple')
example
fprintf('\nThe correct result is:\nexample = \n  wordHashTable with properties: \n         buckets: {[]  [1×1 wordList]  []  []  []  []  []  []  []  []} \n        capacity: 10\n       currentFR: 0.1000\n    maxFillRatio: 0.7500\n    hashFunction: @wordHashFunction\n      totalWords: 1\n     uniqueWords: 1\n')

fprintf('**************** Test case 1 - bucket ****************\n')
example.buckets{2}
fprintf('\nThe correct result is:\nans = \n  wordList with properties: \n\n    head: [1x1 myWordNode]\n    tail: [1x1 myWordNode]\n')

fprintf('***************** Test case 1 - list *****************\n')
example.buckets{2}.head
fprintf('\nThe correct result is:\nans = \n  myWordNode with properties: \n\n           word: `apple`\n    occurrences: 1\n           prev: [0x0 myWordNode]\n           next: [0x0 myWordNode]\n')

fprintf('\n**************** Test case 2 - insert ****************\n')
fprintf('Your result:\n')
example.insertWord('pear')
example
fprintf('\nThe correct result is:\nexample = \n  wordHashTable with properties: \n         buckets: {[]  [1×1 wordList]  [1×1 wordList]  []  []  []  []  []  []  []} \n        capacity: 10\n       currentFR: 0.2000\n    maxFillRatio: 0.7500\n    hashFunction: @wordHashFunction\n      totalWords: 2\n     uniqueWords: 2\n')

fprintf('\n**************** Test case 2 - bucket ****************\n')
example.buckets{3}
fprintf('\nThe correct result is:\nans = \n  wordList with properties: \n\n    head: [1x1 myWordNode]\n    tail: [1x1 myWordNode]\n')

fprintf('\n***************** Test case 2 - list *****************\n')
example.buckets{3}.head
fprintf('\nThe correct result is:\nans = \n  myWordNode with properties: \n\n           word: `pear`\n    occurrences: 1\n           prev: [0x0 myWordNode]\n           next: [0x0 myWordNode]\n')

%% Test Problem 1.7 - searchWord 
fprintf('\n********************* Problem 1.7 ********************\n')
fprintf('*************** Test case 1 - `apple` ***************\n')
fprintf('Your result:\n')
example.searchWord('apple')
fprintf('\nThe correct result is:\nans = \n  myWordNode with properties: \n\n           word: `apple`\n    occurrences: 1\n           prev: [0x0 myWordNode]\n           next: [0x0 myWordNode]\n')

fprintf('\n*************** Test case 2 - `orange` ***************\n')
fprintf('Your result:\n')
example.searchWord('orange')
fprintf('\nThe correct result is:\nans = \n    `The hash table does not contain the word orange`\n')

%% Test Problem 1.8 - deleteWord
fprintf('\n********************* Problem 1.8 ********************\n')
fprintf('**************** Test case 1 - `pear` ****************\n')
fprintf('Your result:\n')
example.deleteWord('pear')
example
fprintf('\nThe correct result is:\nans = \n  myWordNode with properties: \n\n           word: `pear`\n    occurrences: 1\n           prev: [0x0 myWordNode]\n           next: [0x0 myWordNode]\nexample = \n  wordHashTable with properties: \n         buckets: {[]  [1×1 wordList]  [1×1 wordList]  []  []  []  []  []  []  []} \n        capacity: 10\n       currentFR: 0.1000\n    maxFillRatio: 0.7500\n    hashFunction: @wordHashFunction\n      totalWords: 1\n     uniqueWords: 1\n')

fprintf('\n*************** Test case 2 - `orange` ***************\n')
fprintf('Your result:\n')
example.deleteWord('orange')
fprintf('\nThe correct result is:\nans = \n    `The hash table does not contain the word orange`\n')

%% Test Problem 2
fprintf('\n************************* Problem 2 **************************')
fprintf('\nDisclaimer:\n  This problem is experimental so these are only trends\n')
fprintf('************************ Test case 1 *************************\n')
[listTimes,tableTimes] = compareStorage('Hi', 100, 0.75, @wordHashFunction, 'zebra', 'zebra')
fprintf('Due to the short length of text, the times should be similar\nas they are based on the time to insert only 1 word into each structure.\nThe process to add a word to the short list seems faster than\nhaving to deal with the hash function for one element but removing seems\nfaster for the hash table.\n')

fprintf('\n************************ Test case 2 *************************\n')
[listTimes,tableTimes] = compareStorage('exchange abortive boot decisive disturb level material poison representative spring stingy stink stray limp brick process melt decay merge demonic value infringe create outrageous operate rid zippy opine stretch present sash screw exist wandering division zoo finish boiling burst wrong line rest bead', 100, 0.75, @wordHashFunction, 'zebra', 'zebra')
fprintf('Row 1 of tableTimes should be larger than listTimes but the other\ntwo rows should be smaller for tableTimes on average.\n')

%% Test Problem 3 - minHeap (initializing heap)
fprintf('\n************************* Problem 3 **************************\n')
fprintf('************************ Test case 1 *************************\n')
fprintf('Your result:\n')
heap = minHeap
fprintf('\nThe correct result is:\nheap = \n  minHeap with properties: \n\n    values: []\n')

fprintf('\n************************ Test case 2 *************************\n')
fprintf('Your result:\n')
heap.createHeap(10);
heap
fprintf('\nThe correct result is:\nheap = \n  minHeap with properties: \n\n    values: [Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf]\n')

%% Test Problem 3 - push
fprintf('\n************************ Test case 3 *************************\n')
clear heap
heap = minHeap;
heap.createHeap(5)
x = [83    70    32    96     4];
fprintf('Your result:\n')
for i = 1:5
    heap.push(x(i));
    heap.values
end
heap.push(100)
fprintf('\nThe correct results are:\nans = \n    83   Inf   Inf   Inf   Inf\nans = \n    70    83   Inf   Inf   Inf\nans = \n    32    83    70   Inf   Inf\nans = \n    32    83    70    96   Inf\nans = \n     4    32    70    96    83\nThe heap capacity has been exceeded. Value cannot be added.\n')

%% Test Problem 3 - Pop
fprintf('\n************************ Test case 4 *************************\n')
clear heap
heap = minHeap;
heap.createHeap(3)
x = [83    32    95];
fprintf('Your result:\n')
for i = 1:3
    heap.push(x(i));
end
startValues = heap.values
fprintf('\nThe correct results are:\nstartValues = \n    32    83    95\n\n')
fprintf('Your results:\n')
for i = 1:3
    removed = heap.pop
    Values = heap.values
end
removed = heap.pop
fprintf('\nThe results are:\nremoved = \n    32\nValues =\n    83    95   Inf\nremoved = \n    83\nValues =\n    95   Inf   Inf\nremoved = \n    95\nValues =\n   Inf   Inf   Inf\nremoved =\n    `The heap is empty.`\n')

%% Test Problem 3 - larger array push
fprintf('\n************************ Test case 5 *************************\n')
clear heap
heap = minHeap;
heap.createHeap(25)
x = [10 28 55 96 97 16 98 96 49 81 15 43 92 80 96 66 4 85 94 68 76 75 40 66 18];
fprintf('Your result:\n')
for i = 1:25
    heap.push(x(i));
end
heap.values
fprintf('\nThe correct result is:\nans = \n  Columns 1 through 14\n     4    10    16    15    28    18    80    49    85    68    40    43    92    98\n  Columns 15 through 25\n    96    96    66    96    94    97    76    81    75    66    55\n\n')

%% Zip files

% Lab name
lab = 'Lab10';

% List of function files to zip into submission zip
% You may edit this list if you wish to include other functions
files = {name1,name2,name3,name4};
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

