---
id: 20251019-143120-6380
title: "Brute Force"
approach_type: "Nested Loop"
language: "Go"
tags: [two-sum, brute-force, nested-loops]
---

## 🔍 Idea
* Check every possible pair of elements in the array
* For each pair, check if their sum equals the target
* Return the first matching pair found

## 🧩 Steps
1. Outer loop: Select each element one by one
2. Inner loop: For each outer element, check all remaining elements
3. Check if current pair sums to target
4. If match found, return indices immediately
5. If no match after all checks, return empty slice

## 🧮 Complexity
| Metric  |  Complexity | Explanation |
|---------|-------------|-------------|
| Time    | O(n²)       | Nested loops checking all possible pairs |
| Space   | O(1)        | Only loop variables, no extra data structures |

## ⚡ Code Implementation

```go
func twoSum(nums []int, target int) []int {
    for i := 0; i < len(nums); i++ {
        for j := i + 1; j < len(nums); j++ {
            if nums[i] + nums[j] == target {
                return []int{i, j}
            }
        }
    }
    return []int{}
}