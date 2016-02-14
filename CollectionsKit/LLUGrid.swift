//
//  LLUGrid.swift
//  CollectionsKit
//
//  Created by Lucas Louca on 06/02/16.
//  Copyright © 2016 Lucas Louca. All rights reserved.

public class LLUGrid<T> {
    public var matrix:[T]
    public var rows:Int
    public var columns:Int
    
    public init(rows:Int, columns:Int, defaultValue:T) {
        self.rows = rows
        self.columns = columns
        matrix = Array(count:(rows*columns),repeatedValue:defaultValue)
    }
    
    public func indexIsValidForRow(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    public subscript(row:Int, col:Int) -> T {
        get{
            assert(indexIsValidForRow(row, column: col), "Index out of range")
            return matrix[Int(columns * row + col)]
        }
        set{
            assert(indexIsValidForRow(row, column: col), "Index out of range")
            matrix[(columns * row) + col] = newValue
        }
    }
}
