---
id: 20251021-152850-28184
title: "Hash Table"
approach_type: "Character Frequency Counting"
language: "Go"
tags: [anagram, hash-table, frequency-count, optimal]
---

## 🔍 Idea
* Use character frequency arrays as keys for grouping anagrams
* All anagrams have identical character frequency distributions
* Use fixed-size arrays as map keys for efficient grouping

## 🧩 Steps
1. Create a hash map with frequency arrays as keys and string groups as values
2. For each string in the input:
   - Create a 26-element frequency array counting each character
   - Use this frequency array as a key in the map
   - Append the original string to the group for that key
3. Collect all groups from the map into the result array

## 🧮 Complexity

### Time Complexity: O(m × n)
**Quick Calculation:**
- m strings to process
- Each string of length n takes O(n) to count characters
- Total: m × O(n) = O(m × n)

### Space Complexity: O(m × n)
**Quick Check:**
- Map stores all m strings
- Each string has length n
- Additional O(26) = O(1) per frequency array

| Metric  |  Complexity | Reason |
|---------|-------------|--------|
| **Time**  | O(m × n) | count characters in m strings |
| **Space** | O(m × n) | store all strings |
