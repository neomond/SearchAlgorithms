//  MARK: Bubble sort is an introductory sorting algorithm that iterates through a list and compares pairings of adjacent elements.

//  According to the sorting criteria, the algorithm swaps elements to shift elements towards the beginning or end of the list. (it swaps elements if the element on the left is larger than the one on the right.)

//  By default, a list is sorted if for any element e and position 1 through N:

//  e1 <= e2 <= e3 … eN, where N is the number of elements in the list.

//  The first loop iterates as long as the list is unsorted and we assume it’s unsorted to start.
//
//  Within this loop, another iteration moves through the list. For each pairing, the algorithm asks:
//
//  In comparison, is the first element larger than the second element? If it is, we swap the position of the elements. The larger element is now at a greater index than the smaller element.

//  When a swap is made, we know the list is still unsorted. The outer loop will run again when the inner loop concludes.
//
//  The process repeats until the largest element makes its way to the last index of the list. The outer loop runs until no swaps are made within the inner loop.

//  We are performing n-1 comparisons for our inner loop. Then, we must go through the list n times in order to ensure that each item in our list has been placed in its proper order.
//
//  The n signifies the number of elements in the list. In a worst case scenario, the inner loop does n-1 comparisons for each n element in the list.
//
//  Therefore we calculate the algorithm’s efficiency as: O(n(n - 1) = O(n(n)) = O(n^2)
/// The worst possible runtime for bubble sort occurs when the input list is in reverse order. In this scenario, bubble sort must perform the maximum number of comparisons and swaps to sort the list, leading to a time complexity of \( O(n^2) \).

//  For nearly sorted lists, bubble sort performs relatively few operations since it only performs a swap when elements are out of order.

/// Bubble sort does not have to sort in ascending order. It can be modified to sort in descending order by changing the comparison condition. Instead of swapping when the current element is greater than the next (for ascending), swap when the current element is less than the next (for descending).


/// We’ll use the inout keyword to modify the array directly inside the bubble sort function instead of returning a new array.

func bubbleSort(inputArray: inout[Int]){
    for i in 0..<inputArray.count {
        for j in 1..<inputArray.count - i {
            if inputArray[j] < inputArray[j-1] {
                let temp = inputArray[j]
                inputArray[j] = inputArray[j-1]
                inputArray[j-1] = temp
            }
        }
    }
}

var countBackwards = [10, 8, 3, 1, -5]
print("Array 1 to sort: \(countBackwards)")
// Call bubble sort on reverse sorted
bubbleSort(inputArray: &countBackwards)
print("Sorted array 1: \(countBackwards)")

var countForwards = [-5, 1, 3, 8, 10]
print("Array 2 to sort: \(countForwards)")
// Call bubble sort on sorted
bubbleSort(inputArray: &countForwards)
print("Sorted array 2: \(countForwards)")



// MARK: Bubble Sort Cheatsheet

// MARK: Definition
//Bubble Sort is a simple sorting algorithm that repeatedly steps through the list, compares adjacent elements, and swaps them if they are in the wrong order. It "bubbles" the largest unsorted element to its correct position with each iteration.

// MARK: Algorithm
// - Start from the beginning of the array.
// - Compare adjacent elements:
// - If the current element is larger than the next element, swap them.
// - Repeat this process for every pair of adjacent elements.
// - With each pass, the largest element gets sorted to the correct position.
// - Repeat the process for the unsorted portion of the array.


// MARK: Pseudocode
//  for i = 0 to n - 1:
//    for j = 0 to n - i - 2:
//        if array[j] > array[j + 1]:
//            swap(array[j], array[j + 1])

// MARK: Implementation
// Early Exit: If no swaps are made in a pass, the array is already sorted, and you can stop early.
// Early Exit: If no swaps are made in a pass, the array is already sorted, and you can stop early.

func optimizedBubbleSort(inputArray: inout [Int]) {
    for i in 0..<inputArray.count {
        var swapped = false
        for j in 1..<inputArray.count - i {
            if inputArray[j] < inputArray[j - 1] {
                let temp = inputArray[j]
                inputArray[j] = inputArray[j - 1]
                inputArray[j - 1] = temp
                swapped = true
            }
        }
        if !swapped {
            break // Exit early if no swaps were made
        }
    }
}

var array = [5, 1, 4, 2, 8]
bubbleSort(inputArray: &array)
print(array) // Output: [1, 2, 4, 5, 8]


//Steps:
//[5, 1, 4, 2, 8] → Swap → [1, 5, 4, 2, 8]
//[1, 5, 4, 2, 8] → Swap → [1, 4, 5, 2, 8]
//[1, 4, 5, 2, 8] → Swap → [1, 4, 2, 5, 8]
//[1, 4, 2, 5, 8] → No Swap (8 is already sorted)
