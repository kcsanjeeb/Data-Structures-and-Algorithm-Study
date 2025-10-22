// Package main - starter scaffold; replace with your implementation.
package main

import (
	"fmt"
	"sort"
)

func topKFrequent(nums []int, k int) []int {
	// Step 1: Count frequencies
	count := make(map[int]int) // time: O(1) , space: O(1)
	for _, num := range nums { // time: O(n) , space: O(n)
		count[num]++
	}
	fmt.Println("count --> ", count)
	// Creates: count = map[1:1 2:2 3:3] for input [1,2,2,3,3,3]

	// Step 2: Convert map to slice of pairs
	arr := make([][2]int, 0, len(count)) // time: O(n) , space: O(n)
	for num, cnt := range count {        // time: O(n) , space: O(n)
		arr = append(arr, [2]int{cnt, num})
	}
	fmt.Println("arr   --> ", arr)
	// Creates: arr = [[1,1], [2,2], [3,3]] for input [1,2,2,3,3,3]
	// Each element is [frequency, number]

	// Step 3: Sort by frequency (descending)
	sort.Slice(arr, func(i, j int) bool { // time: O(n log n) , space: O(log n)
		return arr[i][0] > arr[j][0]
	})
	fmt.Println("arr   --> ", arr)
	// Sorts by first element (frequency) in descending order

	// Step 4: Extract top K elements
	res := make([]int, k)    // time: O(1) , space: O(1)
	for i := 0; i < k; i++ { // time: O(k) , space: O(k)
		res[i] = arr[i][1]
	}
	return res
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
