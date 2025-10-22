---
id: 20251022-111101-28291
title: "Sorting"
approach_type: ""
language: "Go"
tags: [  ]
recommended: false
---

## 🔍 Idea
* Count frequency of each number using a hash map
* Convert the map to an array of [frequency, number] pairs  
* Sort the array by frequency in descending order
* Return the first k numbers from the sorted array

---
## 🧮 Complexity

### Time Complexity: O(n log n)
**Quick Calculation:**
- O(n) for counting frequencies
- O(n) for converting map to array
- O(n log n) for sorting the array
- O(k) for extracting top k elements

### Space Complexity: O(n)
**Quick Check:**
- O(n) for frequency map (worst case all unique)
- O(n) for pairs array
- O(k) for result array
- O(log n) for sorting stack

| Metric  |  Complexity | Reason |
|---------|-------------|--------|
| **Time**  | O(n log n) | sorting dominates |
| **Space** | O(n) | hashmap + array storage |

---

## 🧩 Steps

### What count[num]++ does:
#### Step 1: Count Frequencies
* count[num] - This accesses the value in the map for the key num
* ++ - This increments that value by 1
* Step-by-step execution with nums = [1, 2, 2, 3, 3, 3]:
* Initial state: count = {} (empty map)
```bash 
Iteration 1: num = 1

count[1]++ means: count[1] = count[1] + 1

Since count[1] doesn't exist, it returns the zero value for int which is 0

So: count[1] = 0 + 1 = 1

Now: count = {1: 1}
```
```bash 
Iteration 2: num = 2

count[2]++ means: count[2] = count[2] + 1

count[2] doesn't exist → returns 0

So: count[2] = 0 + 1 = 1

Now: count = {1: 1, 2: 1}
```
```bash 
Iteration 3: num = 2

count[2]++ means: count[2] = count[2] + 1

count[2] exists and is 1

So: count[2] = 1 + 1 = 2

Now: count = {1: 1, 2: 2}
```
```bash 
Iteration 4: num = 3

count[3]++ means: count[3] = count[3] + 1

count[3] doesn't exist → returns 0

So: count[3] = 0 + 1 = 1

Now: count = {1: 1, 2: 2, 3: 1}
```
```bash 
Iteration 5: num = 3

count[3]++ means: count[3] = count[3] + 1

count[3] exists and is 1

So: count[3] = 1 + 1 = 2

Now: count = {1: 1, 2: 2, 3: 2}
```
```bash 
Iteration 6: num = 3

count[3]++ means: count[3] = count[3] + 1

count[3] exists and is 2

So: count[3] = 2 + 1 = 3

Final: count = {1: 1, 2: 2, 3: 3}
```

#### Step 2: Convert map to slice of pairs 
* `arr := make([][2]int, 0, len(count))`
    * `[][2]int`
        * This is a slice where each element is an array of 2 integers
        * Example: [[1, 5], [2, 8], [3, 2]]
        * Each inner array [2]int holds: [frequency, number]
    * `0` - The initial length of the slice
        * The slice starts empty (length 0)
        * We'll use append() to add elements
    * `len(count)` - The capacity of the slice
        * Capacity = maximum number of elements it can hold without reallocating memory
        * Since we have len(count) unique numbers in the map, we know exactly how many pairs we need
    
#### Step 3: Sort by frequency (descending)
#### Step 4: Extract top K elements