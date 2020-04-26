classdef wordHashTable < handle        
    properties (SetAccess = protected)
       % Define the properties
    end
    
    methods 
        function createTable(obj, capacity, maxFillRatio, hashFunction)
            % Implement the required code as described in the assignment
        end
        
        function insertWord(obj,word)
           % Implement the required code as described in the assignment
        end
        
        function rehash(obj)
            currentCapacity = obj.capacity;
            obj.capacity = obj.capacity * 2;
            currentTable = obj.buckets;
            obj.buckets = cell(1,obj.capacity);
            obj.uniqueWords = 0;
            obj.totalWords = 0;
            for i = 1:currentCapacity
                if ~isempty(currentTable{i})
                    for j = 1:currentTable{i}.getUnique
                        current = currentTable{i}.removeWord(currentTable{i}.head.word);
                        for k = 1:current.occurrences
                            obj.insertWord(current.word)
                        end
                    end
                end
            end
        end
        
        function node = searchWord(obj, word)
            % Implement the required code as described in the assignment 
        end
        
        function removedWord = deleteWord(obj, word)
            % Implement the required code as described in the assignment
        end
    end
end
            