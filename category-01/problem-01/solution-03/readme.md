---
id: 20251019-142803-8940
title: "Hash Set"
approach_type: ""
language: "Go"
tags: [  ]
---
## 🔍 Idea
* Define the idea here ....

## 🧩 Steps
* Define the steps here ....

## Code Explaination 
* `seen := make(map[int]bool)` : Creates empty map
* `seen[num]` : In Go, when you access a map with a key that doesn't exist, it returns the zero value for that value type.
* `seen[num] = true` : Adding and Updating command

---

## 🧮 Complexity

### Time Complexity: O(n²)
**Quick Calculation:**
```go
func hasDuplicate(nums []int) bool {
    seen := make(map[int]bool)      // O(1) - Constant time initialization
    
    for _, num := range nums {      // O(n) - Loop runs n times (once per element)
        if seen[num] {              // O(1) - Map lookup is constant time
            return true             // O(1) - Return statement
        }
        seen[num] = true            // O(1) - Map insertion is constant time
    }
    return false                    // O(1) - Return statement
}
```
```bash
# Mathematical Breakdown:
Total Time = O(1) + n × [O(1) + O(1)] + O(1)
           = O(1) + n × O(2) + O(1)
           = O(1) + O(2n) + O(1)
           = O(n)  (After dropping constants and lower order terms)
```

### Space Complexity: O(1)
**Quick Check:**
```go
func hasDuplicate(nums []int) bool {
    seen := make(map[int]bool)      // Starts empty, but can grow to store n elements
    
    for _, num := range nums {  
        if seen[num] {              
            return true
        }
        seen[num] = true            // Adds new key-value pair to map
    }
    return false
}
```

| Metric  |  Complexity | Reason |
|---------|-------------|--------|
| **Time**  | O(n) | [1-2 word reason: nested loops/hashmap/recursion] |
| **Space** | O(n) |  Worst case: all elements unique → stores n elements → O(n) |

#### Tradeoff : Fastest, uses more memory