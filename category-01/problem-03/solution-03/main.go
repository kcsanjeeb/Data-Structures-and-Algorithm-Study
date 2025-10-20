// Package main - starter scaffold; replace with your implementation.
package main

import "fmt"

func twoSum(nums []int, target int) any {
	indices := make(map[int]int) // space: O(n) - stores up to n elements | time: O(1) - empty map creation

	for i, n := range nums { // space: O(1) - only loop variables | time: O(n) - runs n times
		indices[n] = i // space: O(n) - adds to map | time: O(1) per opera
	}

	for i, n := range nums { // space: O(1) - only loop variables | time: O(n) - runs n times
		diff := target - n        // time: O(1) - arithmetic operation
		j, found := indices[diff] // time: O(1) - map lookup
		fmt.Println(i, j, found)
		if found && j != i { // time: O(1) - comparison
			return []int{i, j} // time: O(1) | space: O(1) - fixed size slice
		}

	}

	return []int{} // time: O(1) | space: O(1)
}

func solve() interface{} {
	// TODO: implement
	nums := []int{1, 23, 34, 45, 4, 2, 43, 12, 34, 54, 7, 11, 15}
	target := 9
	return twoSum(nums, target)
}

func main() {
	fmt.Println("solve() =>", solve())
}
