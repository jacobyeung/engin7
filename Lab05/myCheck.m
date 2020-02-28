function check=myCheck(next_step)
if isequal(next_step,[1 4]) || isequal(next_step,[3 2])|| isequal(next_step,[4 4])
    check=false;
elseif next_step(1)>5 || next_step(2)>5
    check=false;
else
    check=true;
end
%----------Please do not change this function----------------