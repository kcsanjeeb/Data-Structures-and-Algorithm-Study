// Package main - starter scaffold; replace with your implementation.
package main

import (
	"fmt"
	"sort"
)

func hasDuplicate(nums []int) bool {
	sort.Ints(nums)
	for i := 0; i < len(nums)-1; i++ {
		if nums[i] == nums[i+1] {
			return true
		}
	}
	return false
}

func solve() interface{} {
	// TODO: implement
	// Case I
	// nums := []int{1, 2, 3, 4, 6, 5, 5}
	// Case II
	nums := []int{1, 2, 3, 4, 6, 5, 7, 2}
	return hasDuplicate(nums)
}

func main() {
	fmt.Println("solve() =>", solve())
}
