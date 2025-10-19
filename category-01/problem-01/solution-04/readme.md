---
id: 20251019-142820-1982
title: "Hash Set Length"
approach_type: ""
language: "Go"
tags: [  ]
---

## 🔍 Idea
- Use a hash set to track all unique elements from the input array
- Compare the size of the hash set with the original array length
- If the set has fewer elements than the array, duplicates must exist

## 🧩 Steps
* Create an empty hash set using map[int]struct{}
* Iterate through all elements in the input array
* Add each element to the hash set (duplicates automatically handled by map)
* After processing all elements, compare set size with original array size
* Return true if set size < array size (indicating duplicates were removed)

---

## 🧮 Complexity

### Time Complexity: O(n²)
**Quick Calculation:**
- Single loop through all n elements: O(n)
- Each map insertion operation: O(1)
- Final length comparison: O(1)
- Total: O(n) × O(1) = O(n)

### Space Complexity: O(1)
**Quick Check:**
- Hash set stores all unique elements
- Worst case: all elements are unique → stores n elements
- Memory usage grows linearly with input size

| Metric  |  Complexity | Reason |
|---------|-------------|--------|
| **Time**  | O(n) | Single pass with O(1) map operations |
| **Space** | O(n) | Hash set stores unique elements |
