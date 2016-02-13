//
//  LLUFibonacciHeap.swift
//  CollectionsKit
//
//  Created by Lucas Louca on 09/02/16.
//  Copyright © 2016 Lucas Louca. All rights reserved.
//

import Foundation

private func ==<T>(lhs: LLUFibonacciHeapNode<T>, rhs:LLUFibonacciHeapNode<T>) -> Bool {
    return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
}

private class LLUFibonacciHeapNode<T: Comparable>: CustomStringConvertible, Equatable {
    var degree:Int = 0
    var next:LLUFibonacciHeapNode<T>?
    var prev:LLUFibonacciHeapNode<T>?
    var child:LLUFibonacciHeapNode<T>?
    var key:T
    
    init(key:T) {
        self.key = key
        self.next = self
        self.prev = self
    }
    
    
    var description: String {
        return "[\(key)]"
    }
}

public class LLUFibonacciHeap<T: Comparable> {
    private var min:LLUFibonacciHeapNode<T>?
    
    /// Number of elements in this heap.
    public var count:Int = 0
    
    /// Comparator used to order the elements in this heap, or < if this queue is sorted according to the natural ordering of its elements.
    public var comparator: (obj1: T, obj2: T) -> Bool
    
    /// Returns true if this heap contains no elements.
    public var isEmpty: Bool {
        return count == 0
    }
    
    /// Creates a LLUFibonacciHeap that orders its elements according to the specified comparator.
    ///
    /// - Parameters:
    ///     - comparator:  the comparator that will be used to order this heap. If no comparator is provided, the natural ordering of the elements will be used.
    public init(_ comparator: (obj1: T, obj2: T) -> Bool = {return $0 < $1}) {
        self.comparator = comparator
    }
    
    /// Inserts the specified element into this heap.
    ///
    /// - Parameters:
    ///     - element: The element to add
    public func enqueue(element:T) {
        let node = LLUFibonacciHeapNode<T>(key:element)
        
        self.min = mergeLists(one:node, two:min)
        
        count++
    }
    
    /// Retrieves, but does not remove, the next element in the heap with respect to the given comparator.
    /// If no comparator is provided, elements are returned according to their natural ordering.
    ///
    /// - Returns: The next element in the heap
    public func peek() -> T? {
        return min?.key
    }
    
    /// Retrieves and returns the next element in the heap with respect to the given comparator and removes it from the heap.
    /// If no comparator is provided, elements are returned according to their natural ordering.
    ///
    /// - Returns: The next element in the heap
    public func poll() -> T? {
        if (self.min == nil) {
            return nil
        } else {
            count--
            let minElem = self.min
            
            if (self.min!.next == self.min) {
                // self.min is the only element in the list. Remove it
                self.min = nil
            } else {
                // write the elements next to the
                // min element around the min element to remove it
                self.min!.prev!.next = self.min!.next
                self.min!.next!.prev = self.min!.prev
                
                // arbitrarily set the Heap's min node
                self.min = self.min!.next
            }
            
            
            self.min = mergeLists(one: self.min, two:minElem!.child)
            
            if (self.min == nil) {
                // No nodes left. Return.
                return minElem?.key
            }
            
            // Next, we need to consolidate all of the roots so that there is only one
            // tree of each degree.  For that we allocate an Array degreeArray
            // where degreeArray[i] is either nil or a tree of with degree=i
            var degreeArray: [LLUFibonacciHeapNode<T>?] = []
            var nodesToVisit: [LLUFibonacciHeapNode<T>] = []
            var currentNode = self.min
            while (nodesToVisit.count == 0 || nodesToVisit.first != currentNode) {
                nodesToVisit.append(currentNode!)
                currentNode = currentNode!.next
            }
            
            for var node in nodesToVisit {
                // Merge nodes with equal degrees until no other trees exists with the same degree
                while(true) {
                    while (node.degree >= degreeArray.count) {
                        degreeArray.append(nil)
                    }
                    
                    // If degreeArray doesn't contain a tree for node.degree yet,
                    // insert the node and break
                    if (degreeArray[node.degree] == nil) {
                        degreeArray[node.degree] = node
                        break
                    } else {
                        // A tree already exists with a degree equal to this node's degree. Merge them.
                        let otherNode = degreeArray[node.degree]
                        degreeArray[node.degree] = nil
                        
                        let maxNode = comparator(obj1: node.key , obj2: otherNode!.key) ? otherNode : node
                        let minNode = comparator(obj1: node.key , obj2: otherNode!.key) ? node : otherNode
                        // Remove maxNode from the root list
                        
                        maxNode!.next!.prev = maxNode!.prev
                        maxNode!.prev!.next = maxNode!.next
                        
                        
                        // Make it a standalone tree
                        maxNode!.next = maxNode
                        maxNode!.prev = maxNode
                        
                        // Put it into the minNode's child list
                        minNode!.child = mergeLists(one:minNode!.child, two:maxNode)
                        minNode!.degree++
                        
                        node = minNode!
                        
                    }
                    
                }
                
                if (comparator(obj1: node.key , obj2: self.min!.key)) {
                    self.min = node
                }
            }
            
            return minElem?.key
        }
    }
    
    /// Removes all elements from the priority heap.
    public func clear() {
        self.min = nil
        count = 0
    }
    
    private func mergeLists(one one:LLUFibonacciHeapNode<T>?, two:LLUFibonacciHeapNode<T>?) -> LLUFibonacciHeapNode<T>? {
        if (one == nil && two == nil) {
            return nil
        } else if (one != nil && two == nil) {
            return one
        } else if (one == nil && two != nil) {
            return two
        } else {
            let oldOneNext = one!.next
            one!.next = two!.next
            one!.next!.prev = one
            two!.next = oldOneNext
            two!.next!.prev = two
            
            return comparator(obj1: one!.key , obj2: two!.key) ? one : two
        }
    }
    
    private func merge(one:LLUFibonacciHeap<T>, two:LLUFibonacciHeap<T>) -> LLUFibonacciHeap<T> {
        let result = LLUFibonacciHeap<T>(comparator)
        
        result.min = mergeLists(one: one.min, two:two.min)
        result.count = one.count + two.count
        
        one.min = nil
        two.min = nil
        
        return result
    }
    
}
