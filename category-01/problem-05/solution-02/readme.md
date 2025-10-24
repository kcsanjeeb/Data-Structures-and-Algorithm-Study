---
id: 20251022-111121-28370
title: "Min-Heap"
approach_type: "Min-Heap with Priority Queue"
language: "Go"
tags: ["Heap", "Priority Queue", "Hash Map"]
recommended: true
---

## 🔍 Idea
* Count frequencies of each number using a hash map
* Use a min-heap (priority queue) that compares elements by frequency
* Maintain only K elements in the heap - when size exceeds K, remove the smallest frequency
* Extract results from heap in reverse order to get descending frequency order

## 🧩 Steps
* **What is a Priority Queue?**
    * A data structure where elements are processed based on priority, not insertion order
    * Higher priority elements get processed first
    * In this case, we define "priority" using our comparator function
* `priorityqueue.NewWith`: Create me a queue, but don't use normal first-in-first-out rules. Instead, use MY custom rules (the comparator function) to decide which element is most important.
* `utils.IntComparator(freqA, freqB)` : This function returns:
    * `-1` if freqA < freqB
    * `0` if freqA == freqB 
    * `1` if freqA > freqB
* `freqA := a.([2]int)[0]`: Get frequency from first   element [freq, num]
* `freqB := b.([2]int)[0]`: Get frequency from first element [freq, num]

* `heap.Enqueue([2]int{freq, num})`: Add current element to heap
* `heap.Dequeue()`: Remove the smallest frequency if heap gets too big


**Go maps iterate in random order** 
In Go, when you range over a map, the iteration order is not guaranteed and is intentionally randomized:
```bash
for num, freq := range count {  // RANDOM ORDER!
    // This could give you (2,3), (3,4), (1,2), etc. in any order
}

```
* What's happening in your case:
    * Your count map is: map[1:2 2:3 3:4 4:5 5:6]
    * But when you range over it, Go might give you:
        * First iteration: num=2, freq=3
        * Second iteration: num=3, freq=4
        * Third iteration: num=1, freq=2
        * etc.
* Go randomizes map iteration to prevent developers from relying on order and to encourage writing **order-independent code**.

---

## 🧮 Complexity

### Time Complexity: O(n log k)
**Quick Calculation:**
- O(n) for counting frequencies
- O(n log k) for heap operations (each of n elements costs O(log k))
- O(k) for extracting results

### Space Complexity: O(n + k)
**Quick Check:**
- O(n) for frequency hash map
- O(k) for the min-heap storage
- O(k) for result array

| Metric  |  Complexity | Reason |
|---------|-------------|--------|
| **Time**  | O(n log k) | heap operations |
| **Space** | O(n + k) | hashmap + heap storage |

## Code

```bash
term@mac solution-02 $ go mod init solution-02


term@mac solution-02 $ go get github.com/emirpasic/gods

go: downloading github.com/emirpasic/gods v1.18.1
go: added github.com/emirpasic/gods v1.18.1
```

```go
// Package main - starter scaffold; replace with your implementation.
package main

import (
	"fmt"

	"github.com/emirpasic/gods/queues/priorityqueue"
	"github.com/emirpasic/gods/utils"
)

func topKFrequent(nums []int, k int) []int {
	count := make(map[int]int)
	for _, num := range nums {
		count[num]++
	}

	fmt.Println("=== STEP 1: Frequency Count ===")
	fmt.Println("count :", count)

	heap := priorityqueue.NewWith(func(a, b interface{}) int {
		freqA := a.([2]int)[0]
		freqB := b.([2]int)[0]
		return utils.IntComparator(freqA, freqB)
	})

	fmt.Println("=== STEP 2: Building Heap (size limit:", k, ") ===")

	for num, freq := range count {
		fmt.Printf("\n--- Adding [freq=%d, num=%d] ---\n", freq, num)

		heap.Enqueue([2]int{freq, num})
		fmt.Printf("After Enqueue - Heap size: %d, Elements: %v\n", heap.Size(), heap.Values())

		if heap.Size() > k {
			removed, _ := heap.Dequeue()
			removedPair := removed.([2]int)
			fmt.Printf("❌ REMOVED: [freq=%d, num=%d] (smallest frequency)\n", removedPair[0], removedPair[1])
			fmt.Printf("After Dequeue - Heap size: %d, Elements: %v\n", heap.Size(), heap.Values())
		} else {
			fmt.Println("✅ No removal needed - within size limit")
		}
	}

	fmt.Println("\n=== STEP 3: Final Heap ===")
	res := make([]int, k)
	for i := k - 1; i >= 0; i-- {
		value, _ := heap.Dequeue()
		pair := value.([2]int)
		res[i] = pair[1] // Store the NUMBER (not frequency)
	}
	fmt.Println("Result: ", res)

	return res
}

func solve() interface{} {
	// Use a simple example for clarity
	nums := []int{1, 1, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5}
	k := 2
	return topKFrequent(nums, k)
}

func main() {
	fmt.Println("solve() =>", solve())
}

```