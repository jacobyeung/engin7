function [listTimes,tableTimes] = compareStorage(txt, cap, fR, hF, add, del)
text = strsplit(txt);
list = wordList;
table = wordHashTable;
table.createTable(cap, fR, hF);
node = myWordNode;
listTimes = zeros(3, 1);
tableTimes = zeros(3, 1);
tic;
for i = 1:length(text)
    node.word = text{i};
    node.occurrences = 1;
    list.add(node);
end
listTimes(1) = toc;
tic;
for i = 1:length(text)
    table.insertWord(text{i});
end
tableTimes(1) = toc;
tic;
node.word = add;
node.occurrences = 1;
list.add(node);
listTimes(2) = toc;
tic;
table.insertWord(add);
tableTimes(2) = toc;
tic;
list.removeWord(del);
listTimes(3) = toc;
tic;
table.deleteWord(del);
tableTimes(3) = toc;
end

