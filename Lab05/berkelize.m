function mat = berkelize(mat, row, col, prev_color, new_color)
persistent tab;
if isempty(tab)
    tab = zeros(111, 115);
end
if ~eq(mat(row, col, :), prev_color)
    return;
end
if strcmp(new_color, 'B')
    mat(row, col, 1) = 0;
    mat(row, col, 2) = 50;
    mat(row, col, 3) = 98;
    if row - 1 > 0 && row + 1 <= 111
        if eq(tab(row - 1, col), 0)
            tab(row - 1, col) = 1;
            mat = berkelize(mat, row - 1, col, prev_color, new_color);
        end
        if eq(tab(row + 1, col), 0)
            tab(row + 1, col) = 1;
            mat = berkelize(mat, row + 1, col, prev_color, new_color);
        end
    end
    if col - 1 > 0 && col + 1 <= 115
        if eq(tab(row, col - 1), 0)
            tab(row, col - 1) = 1;
            mat = berkelize(mat, row, col - 1, prev_color, new_color);
        end
        if eq(tab(row, col + 1), 0)
            tab(row, col + 1) = 1;
            mat = berkelize(mat, row, col + 1, prev_color, new_color);
        end
    end
else
    mat(row, col, 1) = 253;
    mat(row, col, 2) = 181;
    mat(row, col, 3) = 21;
    if row - 1 > 0 && row + 1 <= 111
        if eq(tab(row - 1, col), 0)
            tab(row - 1, col) = 1;
            mat = berkelize(mat, row - 1, col, prev_color, new_color);
        end
        if eq(tab(row + 1, col), 0)
            tab(row + 1, col) = 1;
            mat = berkelize(mat, row + 1, col, prev_color, new_color);
        end
    end
    if col - 1 > 0 && col + 1 <= 115
        if eq(tab(row, col - 1), 0)
            tab(row, col - 1) = 1;
            mat = berkelize(mat, row, col - 1, prev_color, new_color);
        end
        if eq(tab(row, col + 1), 0)
            tab(row, col + 1) = 1;
            mat = berkelize(mat, row, col + 1, prev_color, new_color);
        end
    end
end

