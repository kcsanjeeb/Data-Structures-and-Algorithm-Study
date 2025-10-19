// Package main - starter scaffold; replace with your implementation.
package main

import "fmt"

func hasDuplicate(nums []int) bool {
	for i := 0; i < len(nums); i++ {
		for j := i + 1; j < len(nums); j++ {
			if nums[i] == nums[j] {
				return true
			}
		}
	}
	return false
}

func solve() interface{} {
	// TODO: implement
	// Case 1
	// nums := []int{1, 2, 3, 1}
	// Case 2
	nums := []int{1, 2, 3, 4}
	return hasDuplicate(nums)
}

func main() {
	fmt.Println("solve() =>", solve())
}
