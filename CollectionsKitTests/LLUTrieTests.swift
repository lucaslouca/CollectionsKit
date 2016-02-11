//
//  LLUTrieTests.swift
//  LLUTrieTests
//
//  Created by Lucas Louca on 11/02/16.
//  Copyright © 2016 Lucas Louca. All rights reserved.
//

import XCTest
@testable import CollectionsKit

class LLUTrieTests: XCTestCase {
    
    var trie: LLUTrie!
    
    override func setUp() {
        super.setUp()
        self.trie = LLUTrie()
    }
    
    func testAdd() {
        trie.add("taxi")
        XCTAssertEqual(trie.words, ["taxi"])
        trie.add("test")
        XCTAssertEqual(trie.words, ["test", "taxi"])
    }
    
    func testRemoveWord() {
        trie.add("test")
        trie.add("taxi")
        trie.removeWord("taxi")
        XCTAssertEqual(trie.words, ["test"])
        trie.removeWord("hello")
        XCTAssertEqual(trie.words, ["test"])
    }
    
    func testCountWords() {
        trie.add("taxi")
        XCTAssertEqual(trie.countWords("taxi"), 1)
        trie.add("taxi")
        XCTAssertEqual(trie.countWords("taxi"), 2)
        trie.removeWord("taxi")
        XCTAssertEqual(trie.countWords("taxi"), 1)
        trie.removeWord("taxi")
        XCTAssertEqual(trie.countWords("taxi"), 0)
    }
    
    func testCountPrefixes() {
        trie.add("taxi")
        XCTAssertEqual(trie.countPrefixes("taxi"), 1)
    }
    
    func testWordsWithPrefix() {
        trie.add("test")
        trie.add("taxi")
        XCTAssertEqual(trie.wordsWithPrefix("t"), ["test", "taxi"])
        trie.add("te")
        XCTAssertEqual(trie.wordsWithPrefix("t"), ["te", "test", "taxi"])
        XCTAssertEqual(trie.wordsWithPrefix(""), ["te", "test", "taxi"])
        XCTAssertEqual(trie.wordsWithPrefix("tax"), ["taxi"])
        XCTAssertEqual(trie.wordsWithPrefix("taxi"), ["taxi"])
        XCTAssertEqual(trie.wordsWithPrefix("taxii"), [])
    }
    
    func testContains() {
        trie.add("taxi")
        XCTAssertEqual(trie.containsWord("taxi"), true)
        XCTAssertNotEqual(trie.containsWord("hello"), true)
    }
}
