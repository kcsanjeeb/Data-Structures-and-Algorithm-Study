---
id: 20251019-143303-738
title: "Hash Map (Two Pass)"
approach_type: "Hash Map with Two Passes"
language: "Go"
tags: [two-sum, hash-map, two-pass, efficient]
recommended: true
---

## 🔍 Idea
* First pass: Store all numbers with their indices in a hash map
* Second pass: For each number, check if its complement (target - num) exists in the map
* Ensure we don't use the same element twice by checking indices

## 🧩 Steps
1. Create an empty hash map to store numbers and their indices
2. First loop: Store each number with its index in the map
3. Second loop: For each number, calculate the needed complement
4. Check if complement exists in map and is at a different position
5. Return the pair of indices if found, else return empty slice

## 🧮 Complexity
| Metric  |  Complexity | Explanation |
|---------|-------------|-------------|
| Time    | O(n)        | Two passes through n elements with O(1) map operations |
| Space   | O(n)        | Hash map stores up to n key-value pairs |

## ⚡ Code Implementation

```go
func twoSum(nums []int, target int) []int {
    indices := make(map[int]int)
    
    // First pass: Build the map
    for i, num := range nums {
        indices[num] = i
    }
    
    // Second pass: Find the pair
    for i, num := range nums {
        complement := target - num
        if j, exists := indices[complement]; exists && j != i {
            return []int{i, j}
        }
    }
    
    return []int{}
}