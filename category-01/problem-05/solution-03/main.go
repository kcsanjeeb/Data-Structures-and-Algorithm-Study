// Package main - starter scaffold; replace with your implementation.
package main

import "fmt"

func topKFrequent(nums []int, k int) []int {
	// Step 1: Count frequencies (same as before)
	count := make(map[int]int)
	for _, num := range nums {
		count[num]++
	}
	fmt.Println(count)

	// Step 2: Create frequency buckets
	freq := make([][]int, len(nums)+1)
	for num, cnt := range count {
		freq[cnt] = append(freq[cnt], num)
	}
	fmt.Println(freq)
	return []int{}
}

func solve() interface{} {
	nums := []int{1, 1, 2, 2, 2, 3, 3, 3, 3, 5, 5, 5, 5, 5, 5, 5}
	k := 2
	return topKFrequent(nums, k)
}

func main() {
	fmt.Println("solve() =>", solve())
}

// func topKFrequent(nums []int, k int) []int {
// 	count := make(map[int]int)
// 	freq := make([][]int, len(nums)+1)

// 	for _, num := range nums {
// 		count[num]++
// 	}
// 	for num, cnt := range count {
// 		freq[cnt] = append(freq[cnt], num)
// 	}

// 	res := []int{}
// 	for i := len(freq) - 1; i > 0; i-- {
// 		for _, num := range freq[i] {
// 			res = append(res, num)
// 			if len(res) == k {
// 				return res
// 			}
// 		}
// 	}

// 	fmt.Println("count ", count)
// 	fmt.Println("frequ ", freq)

// 	return res
// }
