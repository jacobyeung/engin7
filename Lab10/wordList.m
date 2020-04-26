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
        
        function removedNode = removeWord(obj, word)
            if obj.uniqueWords == 0
                removedNode = 'This word is not in the list';
                return
            end
            if obj.uniqueWords == 1 && strcmp(obj.head.word,word)
                removedNode = obj.head;
                obj.head = myWordNode.empty;
                obj.tail = myWordNode.empty;
                obj.uniqueWords = 0;
                obj.totalWords = 0;
                return
            end
            current = obj.head;
            while ~strcmp(current.word,word)
                if isempty(current.next)
                    removedNode = 'This word is not in the list';
                    return
                else
                    current = current.next;
                end
            end
            obj.uniqueWords = obj.uniqueWords - 1;
            obj.totalWords = obj.totalWords - current.occurrences;
            if current == obj.head
                obj.head = obj.head.next;
                obj.head.prev = myWordNode.empty;
            elseif current == obj.tail
                obj.tail = obj.tail.prev;
                obj.tail.next = myWordNode.empty;
            else
                current.prev.next = current.next;
                current.next.prev = current.prev;
            end
            removedNode = current;
            removedNode.next = myWordNode.empty;
            removedNode.prev = myWordNode.empty;
            clear current
        end
        
        function node = retrieveWord(obj, word)
            if obj.uniqueWords == 0
                node = 'This word does not appear in the list';
                return
            end
            current = obj.head;
            node = myWordNode;
            node.word = word;
            while ~strcmp(current.word,word)
                if isempty(current.next)
                    node = 'This word does not appear in the list';
                    return
                else
                    current = current.next;
                end
            end
            node.occurrences = current.occurrences;
        end
        
        function wordBank = printList(obj)
            if isempty(obj)
                wordBank = {};
            else
                wordBank = cell(1,obj.uniqueWords);
                wordBank{1} = obj.head.word;
                current = obj.tail;
                count = obj.uniqueWords;
                while ~isempty(current.prev)
                    wordBank{count} = current.word;
                    current = current.prev;
                    count = count - 1;
                end
            end
        end

        function frequency = wordFrequency(obj, word)
            if nargin < 2
                if isempty(obj)
                    disp('Your list is empty.')
                    frequency = 0;
                    return
                else
                    frequency = zeros(1,obj.uniqueWords);
                    current = obj.head;
                    count = 1;
                    while count <= obj.uniqueWords
                        frequency(count) = current.occurrences;
                        count = count + 1;
                        current = current.next;
                    end
                end
            else
                node = retrieveWord(obj,word);
                if strcmp(class(node),'char')
                    frequency = 0;
                else
                    frequency = node.occurrences;
                end
            end
        end
        
        function relativeFreq = relativeFreq(obj,word)
            if nargin < 2
                relativeFreq = obj.wordFrequency/obj.totalWords;
            else 
                node = obj.retrieveWord(word);
                if strcmp(class(node),'char')
                    relativeFreq = 0;
                else
                    relativeFreq = node.occurrences/obj.totalWords;
                end
            end
        end
    end
end