//
//  LLUTrieTests.swift
//  LLUTrieTests
//
//  Created by Lucas Louca on 11/02/16.
//  Copyright © 2016 Lucas Louca. All rights reserved.
//

import XCTest
@testable import CollectionsKit

class LLUFibonacciHeapTests: XCTestCase {
    
    var heap: LLUFibonacciHeap<Int>!
    
    override func setUp() {
        super.setUp()
        self.heap = LLUFibonacciHeap<Int>()
    }
    
    func testPoll() {
        heap.enqueue(1)
        XCTAssertEqual(heap.poll(), 1)
        heap.enqueue(3)
        heap.enqueue(1)
        heap.enqueue(4)
        XCTAssertEqual(heap.poll(), 1)
    }
    
    func testEnqueue() {
        heap.enqueue(1)
        XCTAssertNotEqual(heap.isEmpty, true)
    }
    
    func testIsEmpty() {
        heap.enqueue(1)
        XCTAssertNotEqual(heap.isEmpty, true)
        heap.poll()
        XCTAssertEqual(heap.isEmpty, true)
    }
    
    func testPeek() {
        heap.enqueue(1)
        XCTAssertEqual(heap.peek(), 1)
        heap.enqueue(3)
        heap.enqueue(6)
        heap.enqueue(4)
        XCTAssertEqual(heap.poll(), 1)
    }
    
    func testCount() {
        heap.enqueue(1)
        XCTAssertEqual(heap.count, 1)
        heap.poll()
        XCTAssertEqual(heap.count, 0)
    }
    
    func testClear() {
        heap.enqueue(1)
        heap.clear()
        XCTAssertEqual(heap.isEmpty, true)
    }
    
}
