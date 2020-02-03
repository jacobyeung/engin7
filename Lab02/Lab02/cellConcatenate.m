function [C_joined, C_nested] = cellConcatenate(C1, C2)
C_joined = [C1, C2];
C_nested = {C1, C2};
end

