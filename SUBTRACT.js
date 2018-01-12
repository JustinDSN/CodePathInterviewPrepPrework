// Answer for https://www.interviewbit.com/problems/subtract/

// Definition for singly-linked list.
//    function Node(data){
//      this.data = data
//      this.next = null
//    }

module.exports = { 
 //param A : head node of linked list
 //return the head node in the linked list
  subtract : function(A){
        var currentNode = A
        
        var values = []
        
        while (currentNode) {
            values.push(currentNode.data)
            currentNode = currentNode.next
        }
        
        currentNode = A
        
        for (i = 0; i < Math.floor(values.length/2); i++) {
            var minuend = values[(values.length - 1) - i];
            currentNode.data = minuend - currentNode.data;
            currentNode = currentNode.next
        }
        
        return A
  }
};
