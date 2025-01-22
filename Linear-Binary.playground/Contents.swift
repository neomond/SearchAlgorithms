// MARK: - LINEAR SEARCH: CONCEPTUAL

// Linear search is a search algorithm that sequentially checks whether a given value is an element of a specified list by scanning the elements of a list one-by-one until it finds the target value.

//  The time complexity for linear search is O(N), but its performance is dependent on its input:
//  Best Case: The algorithm requires only 1 comparison to find the target value in the first position of the list.
//  Worst Case: The algorithm requires only n comparison to find the target value in the last position of the list or does not exist in the list.
//  Average Case: The algorithm makes N/2 comparisons.
//  Linear search is a good choice for a search algorithm when:

//  You expect the target value to be positioned near the beginning of the list.

//  A search needs to be performed on an unsorted list because linear search traverses the entire list from beginning to end, regardless of its order.

func firstIndex<T: Equatable>(of target: T, in arr: [T]) -> Int? {
    for (index, value) in arr.enumerated() where value == target {
        return index
    }
    return nil
}

let recipe = ["nori", "tuna", "soy sauce", "sushi rice"]
let targetIngredient = "tuna"
if let index = firstIndex(of:targetIngredient, in:recipe) {
    print("Ingredient found at index \(index)")
} else {
    print("Ingredient not found")
}


// MARK: - BINARY SEARCH: CONCEPTUAL

//  Binary search is an efficient searching algorithm that finds the position of a target value within a sorted array. It repeatedly divides the search interval in half:

//  Check the middle value of the dataset.
//  If this value matches our target we can return the index.
//  If the middle value is less than our target
//  Start at step 1 using the right half of the list.
//  If the middle value is greater than our target
//  Start at step 1 using the left half of the list.
//  We eventually run out of values in the list or find the target value.

// Time Complexity:
// O(logn) for recursive implementation.
// O(1) for iterative implementation.

// In the binary search implementation, Range<Int> is used to specify the portion of the array to search. This allows the function to focus on a specific segment of the array, either the left or right half, depending on the comparison with the middle element. By using a range, the function can efficiently narrow down the search area without creating new subarrays, which helps in maintaining performance and reducing memory usage.

func binarySearch<T: Comparable>(for key: T, in arr: [T], withRange range: Range<Int>) -> Int? {
    print("Searching for \(key) in \(arr[range.lowerBound..<range.upperBound])")
    guard range.lowerBound < range.upperBound else {
        print("Invalid range, returning nil")
        return nil
    }
    let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
    if arr[midIndex] == key {
        print("Found \(key) at index \(midIndex)")
        return midIndex
    }
    let newRange: Range<Int>
    if arr[midIndex] < key {
        newRange = (midIndex + 1)..<range.upperBound
    } else {
        newRange = range.lowerBound..<midIndex
    }
    return binarySearch(for: key, in: arr, withRange: newRange)
}

let data = [1, 14, 23, 33, 56, 100, 110, 125, 140]
let target = 23
if let index = binarySearch(for: target, in: data, withRange: 0..<data.count){
    print(index)
}

