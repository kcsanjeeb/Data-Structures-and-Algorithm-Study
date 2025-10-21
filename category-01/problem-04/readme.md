---
id: 20251021-141552-10833
title: "Group Anagrams"
tags: [  ]
difficulty: "Easy"
---

## 🧠 Problem Statement
Given an array of strings strs, group the anagrams together. You can return the answer in any order.

#### ▶️ Example 1:
```bash
Input: strs = ["eat","tea","tan","ate","nat","bat"]

Output: [["bat"],["nat","tan"],["ate","eat","tea"]]

Explanation:

There is no string in strs that can be rearranged to form "bat".
The strings "nat" and "tan" are anagrams as they can be rearranged to form each other.
The strings "ate", "eat", and "tea" are anagrams as they can be rearranged to form each other.
```

#### ▶️ Example 2:
```bash
Input: strs = [""]

Output: [[""]]
```

#### ▶️ Example 3:
```bash
Input: strs = ["a"]

Output: [["a"]]
```

## 🎯 Constrains
* 1 <= strs.length <= 104
* 0 <= strs[i].length <= 100
* strs[i] consists of lowercase English letters.

## Recommended Time & Space Complexity

