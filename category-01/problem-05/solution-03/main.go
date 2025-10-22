// Package main - starter scaffold; replace with your implementation.
package main

import "fmt"

func topKFrequent(nums []int, k int) []int {
	count := make(map[int]int)
	freq := make([][]int, len(nums)+1)

	for _, num := range nums {
		count[num]++
	}
	for num, cnt := range count {
		freq[cnt] = append(freq[cnt], num)
	}

	res := []int{}
	for i := len(freq) - 1; i > 0; i-- {
		for _, num := range freq[i] {
			res = append(res, num)
			if len(res) == k {
				return res
			}
		}
	}

	fmt.Println("count ", count)
	fmt.Println("frequ ", freq)

	return res
}
func solve() interface{} {
	nums := []int{1, 1, 2, 2, 2, 3, 3, 3, 3, 5, 5, 5, 5, 5, 5, 5}
	k := 2
	return topKFrequent(nums, k)
}

func main() {
	fmt.Println("solve() =>", solve())
}
