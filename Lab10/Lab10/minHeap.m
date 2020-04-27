classdef minHeap < handle
    properties (Access = public)
        values = [];
    end
    properties (Access = private)
        capacity = 0;
        heapSize = 0;
    end
    
    methods 
        function createHeap(obj,nodes)
            obj.capacity = nodes;
            obj.values = inf(1, nodes);
        end
        
        function nodes = checkSize(obj)
            nodes = obj.heapSize;
        end
        
        function push(obj,value)
            if obj.heapSize + 1 > obj.capacity
                disp('The heap capacity has been exceeded. Value cannot be added.');
                return;
            end
            obj.heapSize = obj.heapSize + 1;
            index = obj.heapSize;
            obj.values(index) = value;
            while true
                if index == 1
                    break;
                end
                if mod(index, 2) == 1
                    parent = (index - 1) / 2;
                else
                    parent = index / 2;
                end
                if obj.values(parent) <= obj.values(index)
                    break;
                else
                    temp = obj.values(parent);
                    obj.values(parent) = obj.values(index);
                    obj.values(index) = temp;
                    index = parent;
                end
            end
        end
        
        function value = pop(obj)
           if obj.heapSize == 0
               value = 'The heap is empty.';
               return;
           end
           value = obj.values(1);
           obj.values(1) = obj.values(obj.heapSize);
           obj.values(obj.heapSize) = inf;
           obj.heapSize = obj.heapSize - 1;
           index = 1;
           if obj.heapSize == 0 || obj.heapSize == 1
               return;
           end
           while true
               child1 = 2 * index;
               child2 = child1 + 1;
               if (child1 <= obj.capacity && child2 <= obj.capacity) && obj.values(index) > obj.values(child1) && obj.values(index) > obj.values(child2)
                   if obj.values(child1) > obj.values(child2)
                       temp = obj.values(index);
                       obj.values(index) = obj.values(child2);
                       obj.values(child2) = temp;
                       index = child2;
                   else
                       temp = obj.values(index);
                       obj.values(index) = obj.values(child1);
                       obj.values(child1) = temp;
                       index = child1;
                   end
               elseif child1 <= obj.capacity && obj.values(index) > obj.values(child1)
                   temp = obj.values(index);
                   obj.values(index) = obj.values(child1);
                   obj.values(child1) = temp;
                   index = child1;
               elseif child2 <= obj.capacity && obj.values(index) > obj.values(child2)
                   temp = obj.values(index);
                   obj.values(index) = obj.values(child2);
                   obj.values(child2) = temp;
                   index = child2;
               else
                   break;
               end
           end
        end
    end
end