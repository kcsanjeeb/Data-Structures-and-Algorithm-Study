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
