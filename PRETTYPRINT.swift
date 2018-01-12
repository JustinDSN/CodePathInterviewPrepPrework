// Answer to https://www.interviewbit.com/problems/prettyprint/

import Foundation

class Solution {
    func prettyPrint(_ A: inout Int) -> [[Int]] {
      var array: [[Int]] = []
    
      var size = (A*2) - 1
    
      for _ in 0..<size {
        var row: [Int] = []
        for _ in 0..<size {
          row.append(-1)
        }
        array.append(row)
      }
    
      var top = 0
      var bottom = array.count - 1
      var left = 0
      var right = array[0].count - 1
    
      var dir = 0
    
      while (top <= bottom && left <= right) {
        if (dir == 0) {
          for index in left...right {
            array[top][index] = A
          }
          top += 1
          dir += 1
        } else if (dir == 1) {
          for index in top...bottom {
            array[index][right] = A
          }
          right -= 1
          dir += 1
        } else if (dir == 2) {
          for index in (left...right).reversed() {
            array[bottom][index] = A
          }
          bottom -= 1
          dir += 1
        } else if (dir == 3) {
          for index in (top...bottom).reversed() {
            array[index][left] = A
          }
          left += 1
          A -= 1
          dir = 0
        }
      }
    
      return array
    }
}
