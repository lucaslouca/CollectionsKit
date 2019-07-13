# CollectionsKit
CollectionsKit gives the programmer access to collection data structures.

### Setup
#### Carthage
##### Installing Carthage
Install [Carthage](https://github.com/Carthage/Carthage/releases).

##### Integrate CollectionsKit into your project
```
$ cd ~/Path/To/Your/Project
$ echo 'github "lucaslouca/CollectionsKit"' > Cartfile
$ carthage update --platform iOS
```

##### Link Framework to your Xcode project
1. Open your Xcode project
2. Select your target and choose the *General* tab at the top, and scroll down to the *Embedded Binaries* section at the bottom
3. In Finder navigate to *~/Path/To/Your/Project/Build/iOS/* and drag *CollectionsKit.framework* into the *Embedded Binaries* section in Xcode

##### Import the Framework
```
import CollectionsKit
```

### Supported Collections

- [FibonacciHeap](#llufibonacciheap)
- [Queue](#lluqueue)
- [Grid](#llugrid)
- [Stack](#llustack)
- [Trie](#llutrie)
- [Directed Graph](#lludirectedgraph)

#### LLUFibonacciHeap
An implementation of a [Fibonacci heap](https://en.wikipedia.org/wiki/Fibonacci_heap) data structure for priority queue operations.

##### Sample Usage
###### Create a new heap
```Swift
var heap = LLUFibonacciHeap<Int>(>)
```

###### Enqueue elements
```Swift
heap.enqueue(1)
heap.enqueue(2)
heap.enqueue(3)
heap.enqueue(4)
```

###### Dequeue elements
```Swift
heap.poll()
```

#### LLUQueue
An implementation of a [Queue](https://en.wikipedia.org/wiki/Queue_(abstract_data_type)) data structure for queue operations.

##### Sample Usage
###### Create a new queue
```Swift
var queue = LLUQueue<Int>()
```

###### Enqueue elements
```Swift
queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)
queue.enqueue(4)
```

###### Dequeue elements
```Swift
queue.poll()
```

#### LLUGrid
Class representing a grid, where elements can be accessed using `[x,y]` subscript syntax.

##### Sample Usage
###### Create a new grid
```Swift
var grid = LLUGrid<Bool>(rows: 3, columns: 10, defaultValue: false)
```

###### Fill grid
```Swift
grid[1,1] = true
grid[2,0] = false
```

#### LLUStack
An implementation of a [Stack](https://en.wikipedia.org/wiki/Stack_(abstract_data_type)) data structure for stack operations.

##### Sample Usage
###### Create a new stack
```Swift
var stack = LLUStack<Int>()
```

###### Push items onto the stack
```Swift
stack.push(1)
stack.push(2)
```

###### Pop items
```Swift
stack.pop()
```

#### LLUTrie
An implementation of a [Trie](https://en.wikipedia.org/wiki/Trie) data structure.

##### Sample Usage
###### Create a new trie
```Swift
var trie = LLUTrie()
```

###### Add words
```Swift
trie.add("tall")
trie.add("taxi")
```

###### Search words by prefix
```Swift
trie.wordsWithPrefix("ta") // ["taxi", "tall"]
```

#### LLUDirectedGraph
An implementation of a directed graph data structure.

##### Sample Usage
###### Create a new graph
```Swift
var graph = LLUDirectedGraph<Int>()
```

###### Add nodes
```Swift
graph.addNode(1)
graph.addNode(2)
graph.addNode(3)
```

###### Add edges
```Swift
try! graph.addEdge(1, destination: 2)
try! graph.addEdge(2, destination: 3)
```

###### Retrieve neighbors
```Swift
let neighbors = try! graph.neighborsOf(1)
```

### License
```
This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to <http://unlicense.org/>
```
