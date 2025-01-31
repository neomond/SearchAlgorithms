// MARK: - Quicksort: Swift

//Quicksort is a sorting algorithm that is based on the divide-and-conquer strategy. That means like merge sort, the input array is divided into smaller parts to be rearranged.

//The problem: many values in the array which are out of order.
//
//The solution: break the array into sub-arrays containing at most one element. One element is sorted by default!
//We choose a single pivot element from the list. Every other element is compared with the pivot, which partitions the array into three groups.
//A sub-array of elements smaller than the pivot.
//The pivot itself.
//A sub-array of elements greater than the pivot.

//Quicksort is an unusual algorithm in that the worst case runtime is O(N^2), but the average case is O(N * logN).


//func quicksort(_ array: [Int]) -> [Int] {
//  guard array.count > 1 else { return array }
//
//  let pivot = array[array.count / 2]
//  let smallerElements = array.filter { $0 < pivot }
//  let equalElements = array.filter { $0 == pivot }
//  let greaterElements = array.filter { $0 > pivot }
//}
//
//return quicksort(smallerElements) + equalElements + quicksort(greaterElements)

//recursively defining a pivot point
//sorting elements based on value relative to the pivot value
//concatenating the arrays back once they are sorted


func quicksort(_ array: inout [Int], from start: Int, to end: Int) {
  if start < end {
    let partitionIndex = partition(&array, from: start, to: end)
    quicksort(&array, from: start, to: partitionIndex-1)
    quicksort(&array, from: partitionIndex+1, to: end)
  }
}

func partition(_ array: inout [Int], from start: Int, to end: Int) -> Int {
  let pivot = array[end]

  var currentIndex = start
  for index in currentIndex..<end {
    if array[index] <= pivot {
      array.swapAt(currentIndex, index)
      currentIndex += 1
    }
  }

  array.swapAt(currentIndex, end)
  return currentIndex
}
