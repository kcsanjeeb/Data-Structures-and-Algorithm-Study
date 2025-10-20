// Package main - starter scaffold; replace with your implementation.
package main

import (
	"fmt"
)

func twoSum(nums []int, target int) any {
	indices := make(map[int]int)
	fmt.Println(indices)
	for i, n := range nums {
		diff := target - n
		if j, found := indices[diff]; found {
			return []int{j, i}
		}
		indices[n] = i
	}

	return []int{}

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
