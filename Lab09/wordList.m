classdef wordList < handle
    properties (SetAccess = protected)
        head = myWordNode.empty;
        tail = myWordNode.empty;
    end
    properties (Access = private) % Do not change this line
       uniqueWords = 0;
       totalWords = 0;
    end
    
    methods        
        function uniqueWords = getUnique(obj)
           uniqueWords = obj.uniqueWords;
        end
        
        function totalWords = getTotal(obj)
           totalWords = obj.totalWords;
        end
        
        function add(obj, newWord)
            assert(isa(newWord, 'myWordNode'));
            if obj.totalWords == 0
                newWord.prev = myWordNode.empty;
                newWord.next = myWordNode.empty;
                obj.head = newWord;
                obj.tail = newWord;
                obj.uniqueWords = 1;
                obj.totalWords = 1;
            else
                current = obj.head;
                alphabet = sort({newWord.word,current.word});
                if strcmp(current.word,newWord.word)
                    current.occurrences = current.occurrences + 1;
                    obj.totalWords = obj.totalWords + 1;
                    return
                elseif strcmp(alphabet{1},newWord.word) 
                    obj.head = newWord;
                    obj.head.next = current;
                    current.prev = obj.head;
                    obj.uniqueWords = obj.uniqueWords + 1;
                    obj.totalWords = obj.totalWords + 1;
                    return
                end
                while strcmp(alphabet{2},newWord.word) 
                    if isempty(current.next)
                        if strcmp(current.word,newWord.word)
                            current.occurrences = current.occurrences + 1;
                            obj.totalWords = obj.totalWords + 1;
                        else
                            current.next = newWord;
                            newWord.prev = current;
                            obj.uniqueWords = obj.uniqueWords + 1;
                            obj.totalWords = obj.totalWords + 1;
                            obj.tail = newWord;
                        end
                        return
                    else
                        if strcmp(current.word,newWord.word)
                            current.occurrences = current.occurrences + 1;
                            obj.totalWords = obj.totalWords + 1;
                            return
                        else
                            current = current.next;
                            alphabet = sort({newWord.word,current.word});
                        end
                    end
                end
                current = current.prev;
                newWord.prev = current;
                newWord.next = current.next;
                current.next = newWord;
                newWord.next.prev = newWord;
                obj.uniqueWords = obj.uniqueWords + 1;
                obj.totalWords = obj.totalWords + 1;
            end
        end
        
        function removedNode = removeWord(obj,word)
            first = obj.head;
            current = first;
            while ~isempty(current)
               prev = current.prev;
               next = current.next;
               if strcmp(word, current.word)
                   if isempty(prev)
                        obj.head = next;
                   else
                       prev.next = next;
                   end
                   if isempty(next)
                        obj.tail = prev;
                   else
                       next.prev = prev;
                   end
                   current.next = myWordNode.empty;
                   current.prev = myWordNode.empty;
                   removedNode = current;
                   uniqueObj = current.occurrences;
                   obj.uniqueWords = obj.uniqueWords - 1;
                   obj.totalWords = obj.totalWords - uniqueObj;
                   return;
               end
               current = current.next;
            end
            disp("This word is not in the list");
        end
        
        function node = retrieveWord(obj, word)
            current = obj.head;
            while ~isempty(current)
                if strcmp(word, current.word)
                    node.word = current.word;
                    node.occurrences = current.occurrences;
                    node.prev = myWordNode.empty;
                    node.next = myWordNode.empty;
                    return;
                end
                current = current.next;
            end
            disp("This word does not appear in the list");
        end
        
        function wordBank = printList(obj)
            current = obj.head;
            wordBank = cell(1, obj.uniqueWords);
            count = 1;
            while ~isempty(current)
                wordBank(count) = cellstr(current.word);
                current = current.next;
                count = count + 1;
            end
        end
               
        function frequency = wordFrequency(obj,word)
            if nargin == 1
                current = obj.head;
                frequency = ones(1, obj.uniqueWords);
                count = 1;
                while ~isempty(current)
                    frequency(count) = current.occurrences;
                    current = current.next;
                    count = count + 1;
                end
            else
                node = retrieveWord(obj, word);
                frequency = node.occurrences;
            end
        end
        
        function relativeFreq = relativeFreq(obj,word)
            total = obj.totalWords;
            if nargin == 1
                current = obj.head;
                relativeFreq = ones(1, obj.uniqueWords);
                count = 1;
                while ~isempty(current)
                    relativeFreq(count) = current.occurrences / total;
                    current = current.next;
                    count = count + 1;
                end
            else
                node = retrieveWord(obj, word);
                relativeFreq = node.occurrences / total;
            end
        end
    end
end