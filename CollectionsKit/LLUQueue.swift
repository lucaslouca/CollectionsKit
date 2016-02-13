//
//  LLUQueue.swift
//  CollectionsKit
//
//  Created by Lucas Louca on 09/02/16.
//  Copyright © 2016 Lucas Louca. All rights reserved.
//

import Foundation

public class LLUQueue<T>: CustomStringConvertible {
    private var elements:[T]
    
    /// Creates a new LLUQueue
    public init() {
        elements = []
    }
    
    /// Inserts the specified element into this queue.
    ///
    /// - Parameters:
    ///     - element: The element to add
    public func enqueue(element:T) {
        elements.append(element)
    }
    
    /// Retrieves, but does not remove, the next element in the queue.
    ///
    /// - Returns: The next element in the queue
    public func peek() -> T? {
        return elements.first
    }
    
    /// Dequeues and returns the next element in the queue and removes it from the queue.
    ///
    /// - Returns: The next element in the queue
    public func poll() -> T? {
        let obj = elements.first
        elements.removeFirst()
        return obj
    }
    
    /// Number of elements in this queue.
    public var count: Int {
        return elements.count
    }
    
    /// Returns true if this queue contains no elements.
    public var isEmpty: Bool {
        return count == 0
    }
    
    /// Removes all elements in the queue.
    public func clear() {
        elements.removeAll()
    }
    
    /// A textual representation of the queue.
    public var description: String {
        return "[" + elements.map{"\($0)"}.joinWithSeparator(", ") + "]"
    }
}
