public class LLUTrie {
    private var wordCount:Int = 0
    private var prefixCount:Int = 0
    private var edges:[Character: LLUTrie]
    
    /// All words in the trie
    public var words:[String] {
        return self.wordsWithPrefix("")
    }
    
    /// Creates a new LLUTrie
    public init() {
        edges = [:]
    }
    
    /// Returns true if the trie contains the specified word.
    ///
    /// - Parameters:
    ///     - word: The word to search
    /// - Returns: true if the trie contains the specified word
    public func containsWord(word:String) -> Bool {
        return countWords(word) > 0
    }
    
    /// Returns the number of times the specified word appears in the trie.
    ///
    /// - Parameters:
    ///     - word: The word to search
    /// - Returns: Number of times the specified word appears in the trie
    public func countWords(word:String) -> Int {
        if (word.characters.count == 0) {
            return self.wordCount
        } else {
            let firstChar = firstCharacter(word)
            if (edges[firstChar] != nil) {
                return edges[firstChar]!.countWords(tail(word))
            } else {
                return 0
            }
        }
    }
    
    /// Returns the number of times the specified prefix appears in the trie.
    ///
    /// - Parameters:
    ///     - prefix: The prefix to search
    /// - Returns: Number of times the specified prefix appears in the trie
    public func countPrefixes(prefix:String) -> Int {
        if (prefix.characters.count == 0) {
            return self.prefixCount
        } else {
            let firstChar = firstCharacter(prefix)
            if (edges[firstChar] != nil) {
                return edges[firstChar]!.countPrefixes(tail(prefix))
            } else {
                return 0
            }
        }
    }
    
    /// Inserts the specified word into this trie.
    ///
    /// - Parameters:
    ///     - word: The word to add
    public func add(word:String) {
        if (word.characters.count == 0) {
            self.wordCount++
        } else {
            self.prefixCount++
            let firstChar = firstCharacter(word)
            
            if (edges[firstChar] == nil) {
                edges[firstChar] = LLUTrie() 
            }
            
            edges[firstChar]!.add(tail(word))
        }
    }
    
    private func wordsWithPrefix(prefix:String, currentWord:String) -> [String] {
        if (prefix.characters.count == 0) {
            // Return all available words
            var words:[String] = []
 
            if (self.wordCount > 0) {
                words.append(currentWord)
            }
            
            for (character, _) in self.edges {
                words += self.wordsWithPrefix(String(character), currentWord:"\(currentWord)")
            }

            return words
        } else {
            let firstChar = firstCharacter(prefix)
            if (edges[firstChar] != nil) {
                let words = edges[firstChar]!.wordsWithPrefix(tail(prefix), currentWord:"\(currentWord)\(firstChar)")
                
                return words
            } else {
                return []
            }
        }
    }
    
    /// Decreases the occurrences of the specified word in the trie by 1.
    ///
    /// - Parameters:
    ///     - word: The word to decreases its occurrence
    /// - Returns: true if the word occurrence has been decreased
    public func removeWord(word:String) -> Bool {
        if (word.characters.count == 0) {
            --wordCount
            return true
        } else {
            var removedWord = false
            let firstChar = firstCharacter(word)
            if (edges[firstChar] != nil) {
                removedWord = edges[firstChar]!.removeWord(tail(word))
                if (removedWord) {
                    prefixCount--
                    if (prefixCount == 0) {
                        edges[firstChar] = nil    
                    }
                }
            }
            
            return removedWord
        }
    }
    
    /// Retrieves all words that start with the specified prefix.
    ///
    /// - Parameters:
    ///     - prefix: The prefix to search for
    /// - Returns: All words that start with the specified prefix
    public func wordsWithPrefix(prefix:String) -> [String] {
        return self.wordsWithPrefix(prefix,currentWord:"")
    }
    
    private func tail(word:String) -> String {
        return word.substringWithRange(Range<String.Index>(start: word.startIndex.advancedBy(1), end: word.endIndex))
    }
    
    private func firstCharacter(word:String) -> Character {
        return word[word.startIndex.advancedBy(0)]
    }

}
