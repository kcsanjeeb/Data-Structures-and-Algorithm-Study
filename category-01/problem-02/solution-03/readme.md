---
id: 20251019-142944-15075
title: "Hash Table (Using Array)"
approach_type: "Frequency Counting"
language: "Go"
tags: [array, anagram, frequency-count, optimal]
recommended: true
---

## 🔍 Idea
* Use a fixed-size array as a frequency counter for lowercase English letters
* Increment counts for characters in first string, decrement for second string
* If all array elements are zero, the strings are anagrams
* Most efficient approach for problems with ASCII lowercase constraints

## 🧩 Steps
1. Check if strings have equal length (early optimization)
2. Create a 26-element integer array to count character frequencies
3. Iterate through both strings simultaneously:
   - Increment count for each character in string `s`
   - Decrement count for each character in string `t`
4. Check if all array elements are zero - if yes, strings are anagrams

## 🧮 Complexity
| Metric  |  Complexity | Explanation |
|---------|-------------|-------------|
| Time    | O(n + m)    | Process all characters from both input strings |
| Space   | O(1)        | Fixed 26-element array (constant space) |

## ⚡ Code Implementation

```go
func isAnagram(s string, t string) bool {
    if len(s) != len(t) {
        return false
    }
    
    count := [26]int{}
    for i := 0; i < len(s); i++ {
        count[s[i]-'a']++
        count[t[i]-'a']--
    }
    
    for _, val := range count {
        if val != 0 {
            return false
        }
    }
    return true
}
```