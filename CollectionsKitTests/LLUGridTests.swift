//
//  LLUTrieTests.swift
//  LLUTrieTests
//
//  Created by Lucas Louca on 11/02/16.
//  Copyright © 2016 Lucas Louca. All rights reserved.
//

import XCTest
@testable import CollectionsKit

class LLUGridTests: XCTestCase {
    
    var grid: LLUGrid<Int>!
    
    override func setUp() {
        super.setUp()
        self.grid = LLUGrid<Int>(rows: 3, columns: 3, defaultValue: 6)
    }
    
    func testDefaultValue() {
        XCTAssertEqual(grid[1,1], 6)
        XCTAssertEqual(grid[1,2], 6)
        XCTAssertEqual(grid[2,1], 6)
    }
    
    func testIndexIsValidForRow() {
        XCTAssertEqual(grid.indexIsValidForRow(1, column: 2), true)
        XCTAssertNotEqual(grid.indexIsValidForRow(3, column: 2), true)
        XCTAssertNotEqual(grid.indexIsValidForRow(1, column: 3), true)
        XCTAssertNotEqual(grid.indexIsValidForRow(3, column: 3), true)
        XCTAssertNotEqual(grid.indexIsValidForRow(-1, column: -1), true)
        XCTAssertNotEqual(grid.indexIsValidForRow(-1, column: 0), true)
        XCTAssertNotEqual(grid.indexIsValidForRow(0, column: -1), true)
    }
    
    
}
