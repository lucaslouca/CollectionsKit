//
//  LLUStackTests.swift
//  LLUStackTests
//
//  Created by Lucas Louca on 11/02/16.
//  Copyright © 2016 Lucas Louca. All rights reserved.
//

import XCTest
@testable import CollectionsKit

class LLUStackTests: XCTestCase {
    
    var stack: LLUStack<Int>!
    
    override func setUp() {
        super.setUp()
        self.stack = LLUStack<Int>()
    }
    
    func testPop() {
        stack.push(1)
        XCTAssertEqual(stack.pop(), 1)
        stack.push(3)
        stack.push(1)
        stack.push(4)
        XCTAssertEqual(stack.pop(), 4)
    }
    
    func testPush() {
        stack.push(1)
        XCTAssertNotEqual(stack.isEmpty, true)
    }
    
    func testIsEmpty() {
        stack.push(1)
        XCTAssertNotEqual(stack.isEmpty, true)
        stack.pop()
        XCTAssertEqual(stack.isEmpty, true)
    }
    
    func testPeek() {
        stack.push(1)
        XCTAssertEqual(stack.peek(), 1)
        stack.push(3)
        stack.push(6)
        stack.push(4)
        XCTAssertEqual(stack.pop(), 4)
    }
    
    func testCount() {
        stack.push(1)
        XCTAssertEqual(stack.count, 1)
        stack.pop()
        XCTAssertEqual(stack.count, 0)
    }
    
    func testClear() {
        stack.push(1)
        stack.clear()
        XCTAssertEqual(stack.isEmpty, true)
    }
    
}
