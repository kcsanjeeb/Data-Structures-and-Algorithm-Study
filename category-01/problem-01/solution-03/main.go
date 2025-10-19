// Package main - starter scaffold; replace with your implementation.
package main

import "fmt"

func hasDuplicates(nums []int) bool {
	seen := make(map[int]bool) // Step 1: Create empty map
	for _, num := range nums { // Step 2: Loop through each number
		if seen[num] { // Step 3: Check if the number exist in map
			return true // Step 4: If yes, duplicate found!
		}
		seen[num] = true // Step 5: If no, add to map
	}
	return false
}

func solve() interface{} {
	// TODO: implement
	nums := []int{1, 2, 3, 4, 5, 6, 7, 7}
	return hasDuplicates(nums)
}

func main() {
	fmt.Println("solve() =>", solve())
}
