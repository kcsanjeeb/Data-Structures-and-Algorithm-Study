---
id: 20251021-142047-7597
title: "Sorting"
approach_type: "Sort Strings and Group by Sorted Key"
language: "Go"
tags: [anagram, sorting, hash-map, group]
---

## 🔍 Idea
* Sort each string to create a canonical form for anagrams
* Use the sorted string as a key to group anagrams together
* All anagrams will have the same sorted representation

## 🧩 Steps
1. Create a hash map to store sorted strings as keys and groups as values
2. For each string in the input array:
   - Sort the string characters alphabetically
   - Use the sorted string as a key in the map
   - Append the original string to the group for that key
3. Collect all groups from the map into the result array

---

## 🧮 Complexity

### Time Complexity: O(m × n log n)
**Quick Calculation:**
- m strings to process
- Each string of length n takes O(n log n) to sort
- Total: m × O(n log n) = O(m × n log n)

### Space Complexity: O(m × n)
**Quick Check:**
- Map stores all m strings
- Each string has length n
- Total characters stored: m × n

| Metric  |  Complexity | Reason |
|---------|-------------|--------|
| **Time**  | O(m × n log n) | sorting m strings |
| **Space** | O(m × n) | store all strings |

## ⚡ Code Implementation

```go
func groupAnagrams(strs []string) [][]string {
    res := make(map[string][]string)
    for _, s := range strs {
        sorted := sortString(s)
        res[sorted] = append(res[sorted], s)
    }
    
    result := make([][]string, 0, len(res))
    for _, group := range res {
        result = append(result, group)
    }
    return result
}

func sortString(s string) string {
    chars := []rune(s)
    sort.Slice(chars, func(i, j int) bool {
        return chars[i] < chars[j]
    })
    return string(chars)
}
```