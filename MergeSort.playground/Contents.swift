// MARK: MERGE SORT
// Merge sort is a sorting algorithm created by John von Neumann in 1945. Merge sort’s “killer app” was the strategy that breaks the list-to-be-sorted into smaller parts, sometimes called a divide-and-conquer algorithm.

// In a divide-and-conquer algorithm, the data is continually broken down into smaller elements until sorting them becomes really simple.

///  Separating a list into sublists makes sorting faster because it reduces the complexity of the sorting task.
///  By breaking down a large list into smaller, more manageable sublists, each sublist can be sorted individually, which is simpler and quicker.
///  This approach, known as “divide and conquer,” allows the algorithm to handle smaller problems that are easier to solve.
///  Once the sublists are sorted, they can be efficiently merged back together, resulting in a fully sorted list. This method reduces the overall time complexity, making the sorting process faster.

///  In merge sort, when merging two sorted lists, the elements are compared and added to the result list in sorted order.
///  Since both lists are already sorted, any leftover elements in either list must be larger than all elements already added to the result list.
///  This is because the merging process always picks the smallest available element from the two lists.
///  Therefore, any remaining elements are guaranteed to be larger than those already merged.

///  Merging pre-sorted lists is important because it ensures that the merging process is efficient and results in a sorted list.
///  When lists are pre-sorted, the smallest elements are always at the beginning, allowing for a straightforward comparison and merging process.
///  This guarantees that the resulting list is sorted without needing additional sorting steps, reducing the overall time complexity and making the merge operation efficient.

///  Merge sort requires additional space because it creates temporary arrays to hold the divided sublists during the sorting process. This duplication of data results in a space complexity of \( O(N) \).

///  An efficient sort that doesn't require additional space is an "in-place" sort, like quicksort. Quicksort sorts the data within the original array, using a partitioning method.
///  Trade-offs for in-place sorting include:
/// - Quicksort has a worst-case time complexity of \( O(N^2) \) if not implemented with optimizations like random pivot selection.
/// - In-place sorts can be more complex to implement and may not be stable, meaning equal elements might not retain their original order.


func mergeSort(_ inputArray: [Int]) -> [Int] {
    guard inputArray.count > 1 else {
        return inputArray
    }
    
    let midIndex = inputArray.count/2
    let leftArray = Array(inputArray[0..<midIndex])
    let rightArray = Array(inputArray[midIndex..<inputArray.count])
    
    let leftMerge = mergeSort(leftArray)
    let rightMerge = mergeSort(rightArray)
    
    return merge(leftArray: leftMerge, rightArray: rightMerge)
}


func merge(leftArray: [Int], rightArray: [Int]) -> [Int] {
    var leftIndex = 0
    var rightIndex = 0
    var orderedArray: [Int] = []
    
    while leftIndex < leftArray.count && rightIndex < rightArray.count {
        let leftElement = leftArray[leftIndex]
        let rightElement = rightArray[rightIndex]
        
        if leftElement < rightElement {
            orderedArray.append(leftElement)
            leftIndex += 1
        } else {
            orderedArray.append(rightElement)
            rightIndex += 1
        }
    }
    return orderedArray + Array(leftArray.dropFirst(leftIndex)) + Array(rightArray.dropFirst(rightIndex))
}


let countBackwards = [10, 8, 3, 1, -5]
print("Array 1 to sort: \(countBackwards)")
// Call MergeSort on countBackwards
let sortedArray1 = mergeSort(countBackwards)
print(sortedArray1)

let countForwards = [-5, 1, 3, 8, 10]
print("Array 2 to sort: \(countForwards)")
// Call MergeSort on countForwards
let sortedArray2 = mergeSort(countForwards)
print(sortedArray2)
