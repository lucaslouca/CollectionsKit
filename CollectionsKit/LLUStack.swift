public class LLUStack<T>: CustomStringConvertible {
    private var items:[T]
    
    /// Number of elements in this stack.
    public var count:Int {
        return items.count
    }
    
    /// Returns true if this stack contains no elements.
    public var isEmpty: Bool {
        return self.count == 0
    }
    
    /// Creates a new LLUStack
    public init() {
        items = []
    }
    
    /// Pushes an item onto the top of this stack.
    ///
    /// - Parameters:
    ///     - item: The item to add
    public func push(item:T) {
        items.append(item)
    }
    
    /// Removes the item at the top of this stack and returns that item.
    ///
    /// - Returns: The item at the top of this stack
    public func pop() -> T? {
        return (self.count > 0) ? items.removeLast() : nil
    }
    
    /// Retrieves, but does not remove, the item at the top of this stack.
    ///
    /// - Returns: The item at the top of this stack
    public func peek() -> T? {
        return items.last
    }
    
    /// Removes all elements in the stack.
    public func clear() {
        items.removeAll()
    }
    
    /// A textual representation of the stack.
    public var description: String {
        return "[" + items.map{"\($0)"}.joinWithSeparator(", ") + "]"
    }
}
