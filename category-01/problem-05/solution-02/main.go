// Package main - starter scaffold; replace with your implementation.
package main

import (
	"fmt"
	// "github.com/emirpasic/gods/queues/priorityqueue"
	// "github.com/emirpasic/gods/utils"
)

func topKFrequent(nums []int, k int) []int {
	return []int{}
}

func solve() interface{} {
	// TODO: implement
	nums := []int{1, 1, 2, 2, 2, 3, 3, 3, 3, 5, 5, 5, 5, 5, 5, 5}
	k := 2
	return topKFrequent(nums, k)
}

func main() {
	fmt.Println("solve() =>", solve())
}

// func topKFrequent(nums []int, k int) []int {

// 	// Step 1: Count frequencies (same as before)
// 	count := make(map[int]int)
// 	for _, num := range nums {
// 		count[num]++
// 	}
// 	// count = {1:1, 2:2, 3:3} for [1,2,2,3,3,3]

// 	// Step 2: Create a MIN-HEAP that compares by frequency
// 	heap := priorityqueue.NewWith(func(a, b interface{}) int {
// 		freqA := a.([2]int)[0]                   // Get frequency from [freq, num]
// 		freqB := b.([2]int)[0]                   // Get frequency from [freq, num]
// 		return utils.IntComparator(freqA, freqB) // Min-heap: smaller frequencies bubble up
// 	})
// 	for num, freq := range count {
// 		heap.Enqueue([2]int{freq, num})
// 		if heap.Size() > k {
// 			heap.Dequeue()
// 		}
// 	}
// 	fmt.Println(heap)

// 	res := make([]int, k)
// 	for i := k - 1; i >= 0; i-- {
// 		value, _ := heap.Dequeue()
// 		res[i] = value.([2]int)[1]
// 	}
// 	return res
// }
