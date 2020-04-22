classdef sid < handle
    properties
        name = [];
        number = [];
    end
    
    methods
        function changeNumber(obj, newNum) 
            obj.number = newNum;
        end
    end
end

