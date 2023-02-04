func swap(_ array: inout [Int], _ i: Int, _ j: Int){
    let temp = array[i]
    array[i] = array[j]
    array[j] = temp
}

//Sorting int values Bubble sort
func bubbleSortIntVal(_ array: inout [Int]) -> [Int] {
    let len = array.count
    for i in 0..<(len-1) {
        for j in 0..<(len-i-1){
            if array[j] > array[j + 1]{
                /*let temp = array[j]
                array[j] = array[j + 1]
                array[j + 1] = temp*/
                swap(&array, j, j+1)
            }
        }
    }
    return array
}
print("bubbleSortIntVal -->")
var array: [Int] = [5,6,3,4,1,22,10]
print(bubbleSortIntVal(&array))


func swapT<T>(_ array: inout [T], _ i: Int, _ j: Int){
    let temp = array[i]
    array[i] = array[j]
    array[j] = temp
}

//Sorting <T> values Bubble sort
func bubbleSortVal<T : Comparable>(_ array: inout [T]) -> [T] {
    let len = array.count
    for i in 0..<(len-1) {
        for j in 0..<(len-i-1){
            if array[j] > array[j + 1]{
                swapT(&array, j, j+1)
            }
        }
    }
    return array
}
print("bubbleSort generic-->")
var arr: [String] = ["H", "G", "Q", "A", "V", "Z", "B", "C"]
print(bubbleSortVal(&arr))
var arrF: [Float] = [1.0, 22.3, 0.1, 5.4, 3.3, 2.1, 55.2]
print(bubbleSortVal(&arrF))


//Sorting int values Quick sort
func quickSortIntVal(_ array: inout [Int], _ l: Int, _ r: Int) -> [Int] {
    if l < r {
        let q = partition(&array, l, r)
        quickSortIntVal(&array, l, q-1)
        quickSortIntVal(&array, q+1, r)
    }
    return array
}

func partition(_ array: inout [Int], _ l: Int, _ r: Int) -> Int {
    let pivot = array[r]
    
    var i = l-1
    
    for j in l...r-1 {
        if (array[j] < pivot){
            i+=1
            swap(&array, i, j)
        }
    }
    swap(&array, i+1, r)
    return (i+1)
}
print("quickSortIntVal -->")
var array1: [Int] = [5,6,3,4,1,22,10]
var lenth = array1.count
print(quickSortIntVal(&array1, 0, lenth-1))


//Sorting <T> values Quick sort
func quickSortVal<T : Comparable>(_ array: inout [T], _ l: Int, _ r: Int) -> [T] {
    if l < r {
        let q = partition(&array, l, r)
        quickSortVal(&array, l, q-1)
        quickSortVal(&array, q+1, r)
    }
    return array
}

func partition<T : Comparable>(_ array: inout [T], _ l: Int, _ r: Int) -> Int {
    let pivot = array[r]
    
    var i = l-1
    
    for j in l...r-1 {
        if (array[j] < pivot){
            i+=1
            swapT(&array, i, j)
        }
    }
    swapT(&array, i+1, r)
    return (i+1)
}
print("quickSort generic-->")
var array2: [Int] = [5,6,3,4,1,22,10]
print(quickSortVal(&array1, 0, array2.count-1))
var arr2: [String] = ["H", "G", "Q", "A", "V", "Z", "B", "C"]
print(quickSortVal(&arr2, 0, arr2.count-1))
var arrFF: [Float] = [1.0, 22.3, 0.1, 5.4, 3.3, 2.1, 55.2]
print(quickSortVal(&arrFF, 0, arrFF.count-1))


//Binary Search 
func binarySearch(_ sortedArr: [Int], _ x: Int) -> Int {
    var rightBound = sortedArr.count-1
    var leftBound = 0
    
    while (true) {
        let middle = (leftBound+rightBound)/2
        if x == sortedArr[middle] {
            return middle
        }
        else if leftBound > rightBound {
            return -1
        }
        else {
            if x > sortedArr[middle] {
                leftBound = middle + 1
            }
            else{
                rightBound = middle - 1 
            }
        }
    }
}
print("binarySearch -->")
var sortArr: [Int] = [1,2,3,4,5,6,7,8,9,10]
var sortRes = binarySearch(sortArr, 6)
print("We search number: 6 and we found: \(sortArr[sortRes])!")
var res = binarySearch(array, 22)
print("We search number: 22 and we found: \(array[res])!")


//Calculate Fibonacci number
func fibonacciNum(_ num: Int) -> Int {
    if num == 1 || num == 2 {
        return 1
    }
    else {
        return fibonacciNum(num-1) + fibonacciNum(num-2)
    }
}
print("fibonacciNum -->")
for i in (1...20) {
    print(fibonacciNum(i))
}




