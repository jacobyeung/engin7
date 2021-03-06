classdef wordHashTable < handle        
    properties (SetAccess = protected)
       buckets = [];
       capacity = [];
       currentFR = [];
       maxFillRatio = [];
       hashFunction = [];
       totalWords = 0;
       uniqueWords = 0;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
    end
    
    methods 
        function createTable(obj, capacity, maxFillRatio, hashFunction)
            obj.buckets = cell(1, capacity);
            obj.capacity = capacity;
            obj.maxFillRatio = maxFillRatio;
            obj.hashFunction = hashFunction;
        end
        
        function insertWord(obj,word)
           obj.totalWords = obj.totalWords + 1;
           hash = obj.hashFunction(word, obj.capacity);
           node = myWordNode;
           node.word = word;
           node.occurrences = 1;
           if cellfun(@isempty, obj.buckets(hash))
               nodeList = wordList;
               nodeList.add(node);
               obj.buckets{hash} = nodeList;
               obj.uniqueWords = obj.uniqueWords + 1;
           else
               if obj.buckets{hash}.wordFrequency == 0
                   obj.uniqueWords = obj.uniqueWords + 1; 
               end
               obj.buckets{hash}.add(node);
           end
           obj.currentFR = obj.totalWords / obj.capacity;
           if obj.currentFR > obj.maxFillRatio
               rehash(obj);
               obj.currentFR = obj.totalWords / obj.capacity;
           end
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
            hash = obj.hashFunction(word, obj.capacity);
            if isempty(obj.buckets{hash})
                node = ['The hash table does not contain the word', ' ', word];
            else
                if obj.buckets{hash}.wordFrequency(word) == 0
                    node = ['The hash table does not contain the word', ' ', word];
                else
                    node = obj.buckets{hash}.retrieveWord(word);
                end
            end
            
        end
        
        function removedWord = deleteWord(obj, word)
            hash = obj.hashFunction(word, obj.capacity);
            if isempty(obj.buckets{hash})
                removedWord = ['The hash table does not contain the word' , ' ', word];
            else
                if obj.buckets{hash}.wordFrequency(word) == 0
                    removedWord = ['The hash table does not contain the word' , ' ', word];
                else
                    removedWord = obj.buckets{hash}.removeWord(word);
                    obj.uniqueWords = obj.uniqueWords - 1;
                    obj.totalWords = obj.totalWords - removedWord.occurrences;
                    obj.currentFR = obj.totalWords / obj.capacity;
                end
            end
        end
    end
end
            