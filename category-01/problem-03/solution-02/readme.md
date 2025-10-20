---
id: 20251019-143133-11214
title: "Sorting + Two Pointers"
approach_type: "Sorting and Two Pointer Technique"
language: "Go"
tags: [two-sum, sorting, two-pointers, efficient]
---

## 🔍 Idea
* Create pairs of (value, original_index) to preserve indices after sorting
* Sort the array based on values while keeping track of original positions
* Use two pointers technique to find the pair that sums to target
* Return the original indices in sorted order

## 🧩 Steps
1. Create an array of pairs `[value, original_index]`
2. Sort the pairs based on the values
3. Initialize two pointers: `i` at start (0), `j` at end (n-1)
4. While `i < j`, check sum of values at both pointers
5. If sum equals target, return original indices in sorted order
6. If sum less than target, move left pointer right (`i++`)
7. If sum greater than target, move right pointer left (`j--`)

## 🧮 Complexity
| Metric  |  Complexity | Explanation |
|---------|-------------|-------------|
| Time    | O(n log n)  | Dominated by sorting step |
| Space   | O(n)        | Additional array to store (value, index) pairs |

## ⚡ Code Implementation

```go
func twoSum(nums []int, target int) []int {
    A := make([][2]int, len(nums))
    for i, num := range nums {
        A[i] = [2]int{num, i}
    }
    sort.Slice(A, func(i, j int) bool {
        return A[i][0] < A[j][0]
    })
    
    i, j := 0, len(nums)-1
    for i < j {
        cur := A[i][0] + A[j][0]
        if cur == target {
            if A[i][1] < A[j][1] {
                return []int{A[i][1], A[j][1]}
            }
            return []int{A[j][1], A[i][1]}
        } else if cur < target {
            i++
        } else {
            j--
        }
    }
    return []int{}
}