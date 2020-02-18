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
answer(2, 2) = {strjoin({'q1', 'X', 'R'}, ',')};
answer(3, 2) = {strjoin({'q1', 'a', 'R'}, ',')};
answer(5, 2) = {strjoin({'q3', 'a', 'L'}, ',')};
answer(3, 3) = {strjoin({'q2', 'Y', 'R'}, ',')};
answer(4, 3) = {strjoin({'q2', 'b', 'R'}, ',')};
answer(5, 3) = {strjoin({'q3', 'b', 'L'}, ',')};
answer(4, 4) = {strjoin({'q3', 'Z', 'L'}, ',')};
answer(5, 5) = {strjoin({'q0', 'X', 'R'}, ',')};
answer(2, 6) = {strjoin({'q4', 'Y', 'R'}, ',')};
answer(3, 6) = {strjoin({'q1', 'Y', 'R'}, ',')};
answer(5, 6) = {strjoin({'q3', 'Y', 'L'}, ',')};
answer(6, 6) = {strjoin({'q4', 'Y', 'R'}, ',')};
answer(4, 7) = {strjoin({'q2', 'Z', 'R'}, ',')};
answer(5, 7) = {strjoin({'q3', 'Z', 'L'}, ',')};
answer(6, 7) = {strjoin({'q4', 'Z', 'R'}, ',')};
answer(6, 8) = {strjoin({'q5', 'B', 'L'}, ',')};
anbncn_table = answer;
end

