// Package main - starter scaffold; replace with your implementation.
package main

import "fmt"

func twoSum(nums []int, target int) any {
	for i := 0; i < len(nums); i++ { // time O(n) space O(1)
		for j := i + 1; j < len(nums); j++ { // time O(n) space O(1)
			if nums[i]+nums[j] == target { // time O(1) space:  No new memory allocation
				return []int{i, j} // time O(1) space O(1)
			}
		}
	}
	return []int{} // time O(1) space O(1)
}

func solve() interface{} {
	// TODO: implement
	nums := []int{3, 4, 5, 6}
	target := 7
	return twoSum(nums, target)
}

func main() {
	fmt.Println("solve() =>", solve())
}
