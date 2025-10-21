---
id: 20251019-143318-1959
title: "Hash Map (One Pass)"
approach_type: "Hash Map with Single Pass"
language: "Go"
tags: [two-sum, hash-map, one-pass, optimal]
---

## 🔍 Idea
* Process numbers in a single pass while building the hash map
* For each number, check if its complement exists in the map before storing the current number
* Return immediately when a valid pair is found
* Most efficient and elegant solution

## 🧩 Steps
1. Create an empty hash map to store numbers and their indices
2. Iterate through each number in the array:
   - Calculate the needed complement (target - current number)
   - Check if complement already exists in the map
   - If found, return the pair of indices immediately
   - If not found, store current number in the map for future checks
3. Return empty slice if no solution found

## 🧮 Complexity
| Metric  |  Complexity | Explanation |
|---------|-------------|-------------|
| Time    | O(n)        | Single pass through n elements with O(1) map operations |
| Space   | O(n)        | Hash map stores up to n key-value pairs |

## ⚡ Code Implementation

```go
func twoSum(nums []int, target int) []int {
    indices := make(map[int]int)
    
    for i, num := range nums {
        complement := target - num
        if j, exists := indices[complement]; exists {
            return []int{j, i}
        }
        indices[num] = i
    }
    
    return []int{}
}