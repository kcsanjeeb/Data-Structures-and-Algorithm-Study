---
id: 20251019-142743-31712
title: "Sorting"
approach_type: "Sorting"
language: "Go"
tags: [  ]
---

## 🔍 Idea
* Sort first, then check adjacent elements
* After sorting, duplicates become neighbors - easy to find with single pass

## 🧩 Steps
* Sort the input array using built-in sort
* Iterate through sorted array comparing each element with its next neighbor
* If any adjacent elements are equal, duplicate found - return true immediately
* If no adjacent duplicates found after full scan, return false

---

## 🧮 Complexity

### Time Complexity: O(n²)
**Reason:** Sorting dominates the time complexity
- `sort.Ints(nums)` → O(n log n) [Quicksort/Introsort]
- Single loop scan → O(n) 
- **Total: O(n log n) + O(n) = O(n log n)**


### Space Complexity: O(1)
**Quick Check:**
**Reason:** In-place sorting
- Go's `sort.Ints` modifies the array in-place
- No additional data structures created

| Metric  |  Complexity | Reason |
|---------|-------------|--------|
| **Time**  | O(n log n) | Sorting Dominates |
| **Space** | O( 1 ) | In Place sort |
