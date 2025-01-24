// MARK: - BINARY SEARCH TREES: SWIFT

// A binary search tree is a data structure that is comprised of nodes in a branching relationship, each node having a key signifying its value.

// The basic rules are:
// The left child and its subtree contain values less than the parent node’s values
// The right child and its subtree contain values greater than the parent node’s values
// Each left and right subtree is in itself an implementation of a BST
// On average, insertion, retrieval, and deletion all run in O(log n) time complexity
// Trees can be traversed in many ways, in order traversal will visit nodes in their least to greatest order

class BinaryNode<T> {
    
    /* Instance Variables */
    var data: T
    var leftChild: BinaryNode?
    var rightChild: BinaryNode?
    
    /* Initializers */
    init(data: T) {
        self.data = data
    }
}

// Checkpoint 1: Add CustomStringConvertible Conformance to BinarySearchTree
class BinarySearchTree<T: Comparable & CustomStringConvertible>: CustomStringConvertible {
    
    /* Instance Variables */
    private var root: BinaryNode<T>?
    
    /* Public Functions */
    
    // add(_:) -> Users add values to BST, if there is no root, it gets added here
    func add(_ value: T) {
        let node = BinaryNode(data: value)
        if let root = self.root {
            add(node, to: root)
        } else {
            self.root = node
        }
    }
    
    // contains(_:) -> Returns a boolean whether the BST contains an element
    func contains(_ value: T) -> Bool {
        contains(value, startingAt: root)
    }
    
    // remove(_:) -> Removes an element from the tree if it exists
    func remove(_ value: T) {
        _ = remove(value, fromParent: root)
    }
    
    
    /* Private Functions */
    
    /* add(_:to:)
     *  Recurses (preorder) down the tree to find where to put the new value
     *  and is does not allow duplicate values */
    private func add(_ node: BinaryNode<T>, to parent: BinaryNode<T>) {
        if node.data < parent.data {
            if let existingLeftNode = parent.leftChild {
                add(node, to: existingLeftNode)
            } else {
                parent.leftChild = node
            }
        } else if node.data > parent.data {
            if let existingRightNode = parent.rightChild {
                add(node, to: existingRightNode)
            } else {
                parent.rightChild = node
            }
        }
    }
    
    /* contains(_:startingAt:)
     *  Recurses (preorder) down the tree to find a value
     *  and returns if the value was found or not. */
    private func contains(_ value: T, startingAt node: BinaryNode<T>?) -> Bool {
        guard let parent = node else {
            return false
        }
        
        var valueFound = false
        
        if value < parent.data {
            valueFound = contains(value, startingAt: parent.leftChild)
        } else if value > parent.data {
            valueFound = contains(value, startingAt: parent.rightChild)
        } else {
            valueFound = true
        }
        return valueFound
    }
    
    /* remove(_:fromParent:)
     *  Recurses (preorder) down the tree to find a value and delete it
     *  from the tree, it deletes in place, so recreates the new tree
     *  as it goes. Essentially, the node to be removed will be replaced with
     *  either the left child or the smallest child on the right. */
    private func remove(_ value: T, fromParent node: BinaryNode<T>?) -> BinaryNode<T>? {
        guard let parent = node else {
            return nil
        }
        
        switch value {
        case _ where value < parent.data:
            parent.leftChild = remove(value, fromParent: parent.leftChild)
        case _ where value > parent.data:
            parent.rightChild = remove(value, fromParent: parent.rightChild)
        case _ where value == parent.data:
            if parent.leftChild == nil {
                return parent.rightChild
            } else if parent.rightChild == nil{
                return parent.leftChild
            } else {
                parent.data = findMinimumValue(parent.rightChild!)
                parent.rightChild = remove(parent.data, fromParent: parent.rightChild)
            }
        default: fatalError("Unexpected value")
        }
        return parent
    }
    
    /* findMinimumValue(_:)
     *  A helper function used to find the minimum value on the right side of the tree */
    private func findMinimumValue(_ node: BinaryNode<T>) -> T {
        var currentNode = node
        
        while let next = currentNode.leftChild {
            currentNode = next
        }
        return currentNode.data
    }
    
    /* CustomStringConvertible Conformance */
    // Checkpoint 2:
    var description: String {
        var text = ""
        inOrderTraversal(root, &text)
        return text
    }
    
    /* inOrderTraversal(_:_:)
     *  Recurses (inorder) to provide the structure for the print function. */
    // Checkpoint 3:
    
    func inOrderTraversal(_ node: BinaryNode<T>?, _ result: inout String) {
        guard let node = node else {
            return
        }
        inOrderTraversal(node.leftChild, &result)
        result += "\(node.data.description) "
        inOrderTraversal(node.rightChild, &result)
    }
}


var numberTree = BinarySearchTree<Int>()
numberTree.add(5)
numberTree.add(6)
numberTree.add(2)
numberTree.add(56)
numberTree.add(34)
numberTree.add(12)
numberTree.add(54)
numberTree.add(3)
print(numberTree)

// -> 2 3 5 6 12 34 54 56
