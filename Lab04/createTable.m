function anbncn_table = createTable()
answer = cell(6, 8);
firstLine = [ nan 'a', 'b', 'c', 'X', 'Y', 'Z', 'B'];
for c = 1:8 
    answer(1, c) = cellstr(firstLine(c));
end
firstCol = [nan ["q0"] 'q1' 'q2' 'q3' 'q4'];
for c = 1:6
    answer(c, 1) = cellstr(firstCol(c));
end
answer(2, 2) = {reshape(char('q1', 'X', 'R'), [1, 6])};
anbncn_table = answer;
end

