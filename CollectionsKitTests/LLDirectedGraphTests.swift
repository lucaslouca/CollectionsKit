//
//  LLDirectedGraphTests.swift
//  CollectionsKit
//
//  Created by Lucas Louca on 13/02/16.
//  Copyright © 2016 Lucas Louca. All rights reserved.
//

import XCTest
@testable import CollectionsKit

class LLUDirectedGraphTests: XCTestCase {
    
    var graph: LLUDirectedGraph<Int>!
    
    override func setUp() {
        super.setUp()
        self.graph = LLUDirectedGraph<Int>()
    }
    
    func testAddNode() {
        graph.addNode(1)
        XCTAssertEqual(graph.nodes, [1])
        
        graph.addNode(2)
        XCTAssertEqual(graph.nodes, [2, 1])
    }
    
    func testAddEdge() {
        graph.addNode(1)
        graph.addNode(2)
        graph.addNode(3)
        graph.addNode(4)
        
        try! graph.addEdge(1, destination: 2)
        try! graph.addEdge(1, destination: 4)
        try! graph.addEdge(3, destination: 3)
        
        XCTAssertEqual(try! graph.edgeExists(1, destination: 2), true)
        XCTAssertEqual(try! graph.edgeExists(1, destination: 4), true)
        XCTAssertEqual(try! graph.edgeExists(3, destination: 3), true)
    }
    
    func testRemoveEdge() {
        graph.addNode(3)
        try! graph.addEdge(3, destination: 3)
        XCTAssertEqual(try! graph.edgeExists(3, destination: 3), true)
        
        try! graph.removeEdge(3, destination: 3)
        XCTAssertNotEqual(try! graph.edgeExists(3, destination: 3), true)
    }
    
    func testNeighbors() {
        graph.addNode(1)
        graph.addNode(2)
        graph.addNode(3)
        graph.addNode(4)
        
        try! graph.addEdge(1, destination: 2)
        try! graph.addEdge(1, destination: 4)
        try! graph.addEdge(3, destination: 3)
        
        XCTAssertEqual(try! graph.neighborsOf(1), [2, 4])
        XCTAssertEqual(try! graph.neighborsOf(3), [3])
    }
    
}

