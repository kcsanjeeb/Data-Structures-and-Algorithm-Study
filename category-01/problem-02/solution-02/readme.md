---
id: 20251019-142932-12348
title: "Hash Map"
approach_type: ""
language: "Go"
tags: [  ]
recommended: true
---
# Hash Map Frequency Counting Approach

## 🔍 Idea
* Use hash maps to count character frequencies in both strings
* Compare the frequency distributions - if identical, strings are anagrams  
* Leverages O(1) hash map operations for efficient counting and comparison

## 🧩 Steps
1. Check if strings have equal length (quick early exit)
2. Create two empty hash maps to store character frequencies
3. Iterate through first string, counting each character's occurrences
4. Iterate through second string, counting each character's occurrences
5. Compare both frequency maps - if all character counts match, return true

## 🧮 Complexity

### Time Complexity: O(n)
**Calculation:**
- Length check: O(1)
- Two counting loops: O(n) + O(n) = O(n) 
- Map comparison: O(k) where k ≤ n (unique characters)
- Total: O(n) + O(n) + O(k) = O(n)

### Space Complexity: O(k)
**Quick Check:**
- Two hash maps storing k unique characters each
- k = number of unique characters (k ≤ n)
- Worst case: all characters unique → O(n)

| Metric  |  Complexity | Explanation |
|---------|-------------|-------------|
| **Time**  | O(n) | Linear pass through both strings with O(1) map operations |
| **Space** | O(k) | Hash maps store unique characters (k ≤ n) |

## ⚡ Code Implementation

```go
func isAnagram(s string, t string) bool {
    if len(s) != len(t) {
        return false
    }
    
    countS := make(map[rune]int)
    countT := make(map[rune]int)
    
    for _, ch := range s {
        countS[ch]++
    }
    
    for _, ch := range t {
        countT[ch]++
    }
    
    for char, countInS := range countS {
        if countT[char] != countInS {
            return false
        }
    }
    
    return true
}
```

## 🧠 Example Run

#### After counting, we have:
```bash
countS = {'r':2, 'a':2, 'c':2, 'e':1}  // From "racecar"
countT = {'c':2, 'a':2, 'r':2, 'e':1}  // From "carrace"
```

### 👣 Step-by-Step Visualization
1. Iteration 1: Let's say char = 'r', countInS = 2
```bash
countS: {'r':2, 'a':2, 'c':2, 'e':1}
          ↑
        Checking 'r'

countT: {'c':2, 'a':2, 'r':2, 'e':1}
                    ↑
                 Found 'r' with value 2

Comparison: 2 == 2 ✅ MATCH!
```
2. Iteration 2: Let's say char = 'a', countInS = 2
```bash
countS: {'r':2, 'a':2, 'c':2, 'e':1}
               ↑
            Checking 'a'

countT: {'c':2, 'a':2, 'r':2, 'e':1}
               ↑
            Found 'a' with value 2

Comparison: 2 == 2 ✅ MATCH!
```
3. Iteration 3: Let's say char = 'c', countInS = 2
```bash
countS: {'r':2, 'a':2, 'c':2, 'e':1}
                    ↑
                 Checking 'c'

countT: {'c':2, 'a':2, 'r':2, 'e':1}
          ↑
       Found 'c' with value 2

Comparison: 2 == 2 ✅ MATCH!
```
4. Iteration 4: Let's say char = 'e', countInS = 1
```bash
countS: {'r':2, 'a':2, 'c':2, 'e':1}
                         ↑
                      Checking 'e'

countT: {'c':2, 'a':2, 'r':2, 'e':1}
                            ↑
                         Found 'e' with value 1

Comparison: 1 == 1 ✅ MATCH!
```
#### 🎯 Final Result: return true
All characters matched! ✅