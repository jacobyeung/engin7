classdef myWordNode < handle
    properties
        word = [];
        occurrences = [];
        prev = myWordNode.empty;
        next = myWordNode.empty;
    end
end

