//
//  LLUDirectedGraph.swift
//  CollectionsKit
//
//  Created by Lucas Louca on 13/02/16.
//  Copyright © 2016 Lucas Louca. All rights reserved.
//

import Foundation

public enum LLUDirectedGraphError: ErrorType {
    case NodeNotInGraph
}

public class LLUDirectedGraph<T: Hashable> {
    private var nodeToNeighbors:[T:Set<T>]
    
    
    /// All nodes in the tree
    public var nodes:[T] {
        return Array(nodeToNeighbors.keys)
    }
    
    /// Create a new LLUDirectedGraph
    public init() {
        nodeToNeighbors = [:]
    }
    
    /// Add a node to the graph
    ///
    /// - Parameters:
    ///     - node:  the node to add to the graph
    public func addNode(node:T) {
        if (nodeToNeighbors[node] == nil) {
            nodeToNeighbors[node] = []
        }
    }
    
    /// Adds a directed edge between the given nodes.
    ///
    /// - Parameters:
    ///     - source:  Edge's source node
    ///     - destination:  Edge's destination node
    ///
    /// - Throws: `LLUDirectedGraphError.NodeNotInGraph` if at least one of the nodes doesn't exist in the graph
    public func addEdge(source:T, destination:T) throws {
        guard nodeToNeighbors[source] != nil && nodeToNeighbors[destination] != nil else {
            throw LLUDirectedGraphError.NodeNotInGraph
        }
        nodeToNeighbors[source]?.insert(destination)
    }
    
    /// Removes an edge between the given nodes.
    ///
    /// - Parameters:
    ///     - source:  Edge's source node
    ///     - destination:  Edge's destination node
    ///
    /// - Throws: `LLUDirectedGraphError.NodeNotInGraph` if at least one of the nodes doesn't exist in the graph
    public func removeEdge(source:T, destination:T) throws {
        guard nodeToNeighbors[source] != nil && nodeToNeighbors[destination] != nil else {
            throw LLUDirectedGraphError.NodeNotInGraph
        }
        nodeToNeighbors[source]?.remove(destination)
    }
    
    /// Get neighbors of the given nodes
    ///
    /// - Parameters:
    ///     - source:  node to retrieve its neighbors
    ///
    /// - Throws: `LLUDirectedGraphError.NodeNotInGraph` if the node isn't in the graph
    ///
    /// - Returns: Neighbors of the given node
    public func neighborsOf(node:T) throws -> Set<T> {
        guard nodeToNeighbors[node] != nil else {
            throw LLUDirectedGraphError.NodeNotInGraph
        }
        
        return nodeToNeighbors[node]!
    }
    
    /// Checks if there exists an edge from source node to destination node
    ///
    /// - Parameters:
    ///     - source:  Edge's source node
    ///     - destination:  Edge's destination node
    ///
    /// - Throws: `LLUDirectedGraphError.NodesNotInGraph` if at least one of the nodes doesn't exist in the graph
    ///
    /// - Returns: Neighbors of the given node
    public func edgeExists(source:T, destination:T) throws -> Bool {
        guard nodeToNeighbors[source] != nil && nodeToNeighbors[destination] != nil else {
            throw LLUDirectedGraphError.NodeNotInGraph
        }
        
        return (nodeToNeighbors[source]?.contains(destination))!
    }
}