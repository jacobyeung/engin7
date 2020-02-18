function output = runTuring(input_tape)
if ~ischar(input_tape)
    disp("Invalid input tape, requires input of a's, b's, c's, and B's");
end
table = createTable();
value = char('q0');
pos = 1;
move = 0;
symbol = char('0');
count = 0;
while pos <= length(input_tape)
    curr_symbol = input_tape(pos);
    [value, ~, move] = transition(table, value, curr_symbol);
    pos = pos + 1;
    if count == 0 && ~strcmp(curr_symbol, 'a')
        output = false;
        return;
    end
    if strcmp(char('q5'), value)
        output = true;
        return;
    elseif strcmp(move, char('0')) && isempty(value)
        output = false;
        return;
    elseif strcmp(symbol, char('0')) && strcmp(curr_symbol, char('B'))
        output = false;
        return;
    end
    if strcmp(symbol, char('0'))
        symbol = curr_symbol;
        count = count - 1;
    end
    if symbol == curr_symbol && ~strcmp(curr_symbol, 'B')
        count = count + 1;
    else
        break;
    end
    symbol = curr_symbol;
end
symbol = char('0');
pos = 1;
index = 0;
n = true;
dummy = count * 3;
while dummy > 0
    curr_symbol = input_tape(pos);
    if strcmp(curr_symbol, 'B') && dummy > 0
        output = false;
        return;
    end
    if strcmp(symbol, curr_symbol)
        index = index + 1;
    elseif strcmp(symbol, char('0'))
        symbol = curr_symbol;
    else
        if index ~= count
            output = false;
            return;
        else
            index = 0;
        end
    end
    pos = pos + 1;
    dummy = dummy - 1;
end
output = n;
    
end

