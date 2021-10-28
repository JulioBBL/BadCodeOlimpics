import Foundation

func isSorted<T>(_ array: [T], by areInOrder: ((T, T) -> Bool)) -> Bool where T: Comparable {
  for index in 0..<array.count-1 {
    if !areInOrder(array[index], array[index+1]) {
      return false
    }
  }

  return true
}

func shuffle<T>(_ array: inout [T]) where T: Comparable {
  var oldArray = array
  var newArray = [T]()

  while !oldArray.isEmpty {
    let index = Int.random(
      in: oldArray.startIndex..<oldArray.endIndex
    )
    newArray.append(oldArray.remove(at: index))
  }

  array = newArray
}

func bogosorted<T>(_ inputArray: [T]) -> [T] where T: Comparable {
  var array = inputArray
  while !isSorted(array, by: >) {
    shuffle(&array)
    print(array)
  }
  return array
}

var unsorted = [6, 3, 4, 8, 1, 9, 7]
bogosorted(unsorted)
