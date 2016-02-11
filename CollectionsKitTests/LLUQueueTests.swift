//
//  LLUTrieTests.swift
//  LLUTrieTests
//
//  Created by Lucas Louca on 11/02/16.
//  Copyright © 2016 Lucas Louca. All rights reserved.
//

import XCTest
@testable import CollectionsKit

class LLUQueueTests: XCTestCase {
    
    var queue: LLUQueue<Int>!
    
    override func setUp() {
        super.setUp()
        self.queue = LLUQueue<Int>()
    }
    
    func testPoll() {
        queue.enqueue(1)
        XCTAssertEqual(queue.poll(), 1)
        queue.enqueue(3)
        queue.enqueue(1)
        queue.enqueue(4)
        XCTAssertEqual(queue.poll(), 3)
    }
    
    func testEnqueue() {
        queue.enqueue(1)
        XCTAssertNotEqual(queue.isEmpty, true)
    }
    
    func testIsEmpty() {
        queue.enqueue(1)
        XCTAssertNotEqual(queue.isEmpty, true)
        queue.poll()
        XCTAssertEqual(queue.isEmpty, true)
    }
    
    func testPeek() {
        queue.enqueue(1)
        XCTAssertEqual(queue.peek(), 1)
        queue.enqueue(3)
        queue.enqueue(6)
        queue.enqueue(4)
        XCTAssertEqual(queue.poll(), 1)
    }
    
    func testCount() {
        queue.enqueue(1)
        XCTAssertEqual(queue.count, 1)
        queue.poll()
        XCTAssertEqual(queue.count, 0)
    }
    
    func testClear() {
        queue.enqueue(1)
        queue.clear()
        XCTAssertEqual(queue.isEmpty, true)
    }
    
}
