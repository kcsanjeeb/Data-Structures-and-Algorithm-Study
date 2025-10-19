---
id: 20251019-142803-8940
title: "Hash Set"
approach_type: ""
language: "Go"
tags: [  ]
---
## 🔍 Idea
* Define the idea here ....

## 🧩 Steps
* Define the steps here ....

## Code Explaination 
* `seen := make(map[int]bool)` : Creates empty map
* `seen[num]` : In Go, when you access a map with a key that doesn't exist, it returns the zero value for that value type.
* `seen[num] = true` : Adding and Updating command

---

## 🧮 Complexity

### Time Complexity: O(n²)
**Quick Calculation:**
```go
func hasDuplicate(nums []int) bool {
    seen := make(map[int]bool)      // O(1) - Constant time initialization
    
    for _, num := range nums {      // O(n) - Loop runs n times (once per element)
        if seen[num] {              // O(1) - Map lookup is constant time
            return true             // O(1) - Return statement
        }
        seen[num] = true            // O(1) - Map insertion is constant time
    }
    return false                    // O(1) - Return statement
}
```
```bash
# Mathematical Breakdown:
Total Time = O(1) + n × [O(1) + O(1)] + O(1)
           = O(1) + n × O(2) + O(1)
           = O(1) + O(2n) + O(1)
           = O(n)  (After dropping constants and lower order terms)
```

### Space Complexity: O(1)
**Quick Check:**
```go
func hasDuplicate(nums []int) bool {
    seen := make(map[int]bool)      // Starts empty, but can grow to store n elements
    
    for _, num := range nums {  
        if seen[num] {              
            return true
        }
        seen[num] = true            // Adds new key-value pair to map
    }
    return false
}
```

| Metric  |  Complexity | Reason |
|---------|-------------|--------|
| **Time**  | O(n) | [1-2 word reason: nested loops/hashmap/recursion] |
| **Space** | O(n) |  Worst case: all elements unique → stores n elements → O(n) |

#### Tradeoff : Fastest, uses more memory

### Conceptual Code 
```go 
func hasDuplicates(nums []int) bool {
	seen := make(map[int]bool)
	fmt.Println("🔍 Starting duplicate detection...")
	fmt.Println("Input array:", nums)
	fmt.Println("Initial map:", seen)
	fmt.Println()

	for i, num := range nums {
		fmt.Printf("Iteration %d: Checking number %d\n", i+1, num)
		fmt.Printf("   Current map: %v\n", seen)
		fmt.Printf("   seen[%d] = %v\n", num, seen[num])

		if seen[num] {
			fmt.Printf("   🚨 DUPLICATE FOUND! %d already exists in map\n", num)
			fmt.Printf("   ✅ Returning: true\n")
			return true
		}

		seen[num] = true
		fmt.Printf("   ➕ Added %d to map\n", num)
		fmt.Printf("   Updated map: %v\n\n", seen)
	}

	fmt.Printf("🎉 No duplicates found!\n")
	fmt.Printf("Final map: %v\n", seen)
	fmt.Printf("✅ Returning: false\n")
	return false
}
```
```bash
term@mac solution-03 $ go run main.go
🔍 Starting duplicate detection...
Input array: [1 2 3 4 5 6 7 7]
Initial map: map[]

Iteration 1: Checking number 1
   Current map: map[]
   seen[1] = false
   ➕ Added 1 to map
   Updated map: map[1:true]

Iteration 2: Checking number 2
   Current map: map[1:true]
   seen[2] = false
   ➕ Added 2 to map
   Updated map: map[1:true 2:true]

Iteration 3: Checking number 3
   Current map: map[1:true 2:true]
   seen[3] = false
   ➕ Added 3 to map
   Updated map: map[1:true 2:true 3:true]

Iteration 4: Checking number 4
   Current map: map[1:true 2:true 3:true]
   seen[4] = false
   ➕ Added 4 to map
   Updated map: map[1:true 2:true 3:true 4:true]

Iteration 5: Checking number 5
   Current map: map[1:true 2:true 3:true 4:true]
   seen[5] = false
   ➕ Added 5 to map
   Updated map: map[1:true 2:true 3:true 4:true 5:true]

Iteration 6: Checking number 6
   Current map: map[1:true 2:true 3:true 4:true 5:true]
   seen[6] = false
   ➕ Added 6 to map
   Updated map: map[1:true 2:true 3:true 4:true 5:true 6:true]

Iteration 7: Checking number 7
   Current map: map[1:true 2:true 3:true 4:true 5:true 6:true]
   seen[7] = false
   ➕ Added 7 to map
   Updated map: map[1:true 2:true 3:true 4:true 5:true 6:true 7:true]

Iteration 8: Checking number 7
   Current map: map[1:true 2:true 3:true 4:true 5:true 6:true 7:true]
   seen[7] = true
   🚨 DUPLICATE FOUND! 7 already exists in map
   ✅ Returning: true
solve() => true
```