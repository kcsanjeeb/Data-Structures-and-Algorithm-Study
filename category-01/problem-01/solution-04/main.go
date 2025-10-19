// Package main - starter scaffold; replace with your implementation.
package main

import "fmt"

func hasDuplicates(nums []int) bool {
	seen := make(map[int]struct{})
	for _, num := range nums {
		seen[num] = struct{}{}
	}
	return len(seen) < len(nums)
}

func solve() interface{} {
	// TODO: implement
	nums := []int{1, 2, 3, 4, 5, 6, 7, 7}
	return hasDuplicates(nums)
}

func main() {
	fmt.Println("solve() =>", solve())
}
