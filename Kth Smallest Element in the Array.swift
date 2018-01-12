import Foundation

class Solution {
    func partition(_ array: inout [Int], start: Int, end: Int) -> Int {
        let pivot = array[end]
        var partitionIndex = start
        
        for index in start..<end {
            if array[index] <= pivot {
                let partitionValue = array[partitionIndex]
                array[partitionIndex] = array[index]
                array[index] = partitionValue
                
                partitionIndex += 1
            }
        }
        
        let partitionValue = array[partitionIndex]
        array[partitionIndex] = array[end]
        array[end] = partitionValue
        
        return partitionIndex
    }
    
    func quickSort(_ array: inout [Int], start: Int, end: Int) {
        if start < end {
            let partitionIndex = partition(&array, start: start, end: end)
            quickSort(&array, start: start, end: partitionIndex - 1)
            quickSort(&array, start: partitionIndex + 1, end: end)
        }
    }
    
    func kthsmallest(_ A: [Int], _ B: inout Int) -> Int {
        var b = A //Makes a copy of A
        quickSort(&b, start: 0, end: b.count - 1)
        
        return b[B-1]
    }
}
