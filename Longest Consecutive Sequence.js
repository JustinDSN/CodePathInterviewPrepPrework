// Answer to https://www.interviewbit.com/problems/longest-consecutive-sequence/

module.exports = { 
 //param A : array of integers
 //return an integer
    longestConsecutive : function(A){
        if (!A || !A.length) return 0;
        
        var map = A.reduce(function (previous, item) {
            previous[item] = true
            return previous
        }, {});
        
        var longestConsecutiveSequence = 1;
        
        A.forEach(function(item) {
            if (map[item]) {
                map[item] = false
                
                var length = 1
                
                var nextNumber = item + 1;
                while(true) {
                    if (map[nextNumber]) {
                        map[nextNumber] = false
                        length = length + 1;
                        nextNumber = nextNumber + 1;
                    
                        if (length > longestConsecutiveSequence) {
                            longestConsecutiveSequence = length
                        }
                    } else {
                        break;
                    }
                }
                
                var previousNumber = item - 1;
                while(true) {
                    if (map[previousNumber]) {
                        map[previousNumber] = false
                        length = length + 1;
                        previousNumber = previousNumber - 1;
                    
                        if (length > longestConsecutiveSequence) {
                            longestConsecutiveSequence = length
                        }
                    } else {
                        break;
                    }
                }
                
            }
            
        });
        
        return longestConsecutiveSequence
    }
};
