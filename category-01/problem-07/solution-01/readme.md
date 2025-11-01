---
id: 20251028-190208-22696
title: "Brute Force"
approach_type: "Nested Loops"
language: "Go"
tags: [ "arrays", "brute-force", "nested-loops" ]
recommended: false
---

## 🔍 Idea
* Calculate the product of all elements except self by iterating through each element and multiplying all other elements
* For each position i, use a nested loop to multiply all elements except the one at position i

## 🧩 Steps
* Initialize a result array of the same length as input
* For each element at index i:
  * Initialize product = 1
  * Loop through all elements j in the array
  * If i != j, multiply product by nums[j]
  * Store the final product in result[i]
* Return the result array

---

## 🧮 Complexity

### Time Complexity: O(n²)
**Quick Calculation:**
- Outer loop runs n times
- Inner loop runs n times for each outer iteration
- Total operations: n × n = n²

### Space Complexity: O(1) - excluding output array
**Quick Check:**
- Only using constant extra variables (prod, i, j, n)
- Result array is part of output requirement
- No additional data structures used

| Metric  |  Complexity | Reason |
|---------|-------------|--------|
| **Time**  | O(n²) | nested loops |
| **Space** | O(1) | constant extra storage |