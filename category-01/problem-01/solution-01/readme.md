---
id: 20251019-142719-25079
title: "Brute Force"
approach_type: ""
language: "Go"
tags: [  ]
---

## 🔍 Idea
* Brute force - check all possible pairs

## 🧩 Steps
* Compare each element with every other element using nested loops

---

## 🧮 Complexity

### Time Complexity: O(n²)
**Quick Calculation:**
- Outer loop runs `n` times
- Inner loop runs `n - i - 1` times each iteration  
- Total operations ≈ n × n/2 = O(n²)

### Space Complexity: O(1)
**Quick Check:**
- ✅ No extra data structures created
- ✅ Only using input array
- ✅ No recursion stack

| Metric  | Complexity | Reason |
|---------|------------|---------|
| **Time** | O( ) | [1-2 word reason: nested loops/hashmap/recursion] |
| **Space** | O( ) | [1-2 word reason: extra storage/recursion stack] |
