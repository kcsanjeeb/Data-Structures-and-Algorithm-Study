---
id: 20251022-111521-20280
title: "Bucket Sort"
approach_type: "Bucket Sort with Frequency Indexing"
language: "Go"
tags: ["Bucket Sort", "Hash Map", "Frequency Counting"]
recommended: true
---

## 🔍 Idea
* Count frequencies of each number using a hash map
* Use frequency as index in a bucket array - each bucket contains numbers with that frequency
* Iterate from highest frequency to lowest to collect top K elements
* Return immediately when K elements are collected

## 🧩 Steps
1. **Count frequencies**: Iterate through nums and count occurrences in hash map
2. **Create frequency buckets**: Create array where index = frequency, value = list of numbers with that frequency
3. **Collect top K**: Iterate buckets from highest to lowest frequency, add numbers to result
4. **Early return**: Stop as soon as K elements are collected

---

## 🧮 Complexity

### Time Complexity: O(n)
**Quick Calculation:**
- O(n) for counting frequencies
- O(n) for creating frequency buckets  
- O(n) for collecting results (worst case)

### Space Complexity: O(n)
**Quick Check:**
- O(n) for frequency hash map
- O(n) for bucket array
- O(k) for result array

| Metric  |  Complexity | Reason |
|---------|-------------|--------|
| **Time**  | O(n) | linear passes through data |
| **Space** | O(n) | hashmap + bucket storage |