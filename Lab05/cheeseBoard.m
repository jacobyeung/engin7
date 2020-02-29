function path = cheeseBoard(current, prev_path)
d = [current(1, 1) + 1, current(1, 2)];
r = [current(1, 1), current(1, 2) + 1];
persistent p;
if eq(size(prev_path), [0 0])
    p = 1;
    prev_path = char.empty;
end
if eq(current, [5 5])
    path(p, 1:length(prev_path)) = prev_path;
    p = p + 1;
elseif ~myCheck(d) || ~myCheck(r)
    return;
else
    if myCheck(r)
        if size(prev_path) == 0
            prev_path = 'R';
        else
            prev_path = strcat(prev_path, 'R');
        end
        path = cheeseBoard(r, prev_path);
    end
    if myCheck(d)
        if size(prev_path) == 0
            prev_path = 'D';
        else
            prev_path = strcat(prev_path, 'D');
        end
        path = cheeseBoard(d, prev_path);
    end
    return;
end

