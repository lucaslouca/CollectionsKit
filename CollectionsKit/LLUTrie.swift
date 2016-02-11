public class LLUTrie {
    private var wordCount:Int = 0
    private var prefixCount:Int = 0
    private var edges:[Character: LLUTrie]
    
    public var words:[String] {
        return self.wordsWithPrefix("")
    }
    
    public init() {
        edges = [:]
    }
    
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
