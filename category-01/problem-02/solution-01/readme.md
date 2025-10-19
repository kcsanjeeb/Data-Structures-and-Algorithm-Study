---
id: 20251019-142913-10955
title: "Sorting"
approach_type: "Sorting"
language: "Go"
tags: [  ]
---

## 🔍 Idea
* Convert both strings to sorted character arrays
* If the sorted versions are identical, the strings are anagrams
* Uses sorting to rearrange characters into canonical form for comparison

## 🧩 Steps
* Check if strings have equal length - if not, they can't be anagrams
* Convert both strings to rune slices to handle Unicode characters properly
* Sort both rune slices in ascending alphabetical order
* Compare the sorted rune slices character by character
* If all characters match, return true (anagrams); otherwise return false

## 🧮 Complexity
| Metric | Complexity | Reason |
|--------|------------|--------|
| **Time** | O(n log n + m log m) | Two sorting operations |
| **Space** | O(n + m) | Two rune slice conversions |

