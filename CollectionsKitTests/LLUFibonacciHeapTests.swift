//
//  LLUFibonacciHeapTests.swift
//  LLUFibonacciHeapTests
//
//  Created by Lucas Louca on 11/02/16.
//  Copyright © 2016 Lucas Louca. All rights reserved.
//

import XCTest
@testable import CollectionsKit

private class DijkstraNode: Comparable, Hashable, CustomStringConvertible   {
    var row:Int
    var column:Int
    var distance:Int = 0
    
    init(row:Int, column:Int) {
        self.row = row
        self.column = column
    }
    
    var hashValue : Int {
        get {
            return "\(self.row),\(self.column)".hashValue
        }
    }
    
    private var description: String {
        return "(\(self.row),\(self.column))"
    }
}

private func < (lhs: DijkstraNode, rhs: DijkstraNode) -> Bool {
    return lhs.distance < rhs.distance
}

private func == (lhs: DijkstraNode, rhs: DijkstraNode) -> Bool {
    return (lhs.row == rhs.row && lhs.column == rhs.column)
}

class LLUFibonacciHeapTests: XCTestCase {
    
    var heap: LLUFibonacciHeap<Int>!
    
    override func setUp() {
        super.setUp()
        self.heap = LLUFibonacciHeap<Int>()
    }
    
    func testReprioritize() {
        let heap2 = LLUFibonacciHeap<DijkstraNode>()
        
        let node1 = DijkstraNode(row: 0, column: 0)
        node1.distance = 4
        let node2 = DijkstraNode(row: 0, column: 1)
        node2.distance = 1000
        let node3 = DijkstraNode(row: 1, column: 0)
        node3.distance = 3
        let node4 = DijkstraNode(row: 1, column: 1)
        node4.distance = 1000
        
        let heapNode1 = heap2.enqueue(node1)
        let heapNode2 = heap2.enqueue(node2)
        let _ = heap2.enqueue(node3)
        let heapNode4 = heap2.enqueue(node4)
        
        XCTAssertEqual(heap2.poll(), node3)
        
        node2.distance = 1
        heap2.reprioritize(heapNode2)
        XCTAssertEqual(heap2.poll(), node2)
        
        node1.distance = 1
        heap2.reprioritize(heapNode1)
        node4.distance = 2
        heap2.reprioritize(heapNode4)
        XCTAssertEqual(heap2.poll(), node1)
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
