function [new_state,new_value,move] = transition(table,now_state,now_value)
if ~iscell(table)
    disp("Table must be a cell array of chars");
end
if ~ischar(now_state)
    disp("now_state must be a 1x2 char array");
end 
if ~ischar(now_value)
    disp("now_value must be a 1x1 char array");
end
instruction = char('aaaaaa');
flag = 0;
for i = 2:6
    if table{i, 1} == now_state
        for j = 2:length(table)
            if table{1, j} == now_value
                if isempty(table{i, j})
                    new_state = now_state;
                    new_value = now_value;
                    move = char('0');
                else
                    instruction = table{i, j};
                    new_state = instruction(1:2);
                    new_value = instruction(4);
                    move = instruction(6);
                    flag = 1;
                    break;
                end
            end
        end
    end
    if flag == 1
        break;
    end
end

end
