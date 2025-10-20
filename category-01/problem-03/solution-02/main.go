// Package main - starter scaffold; replace with your implementation.
package main

import (
	"fmt"
	"sort"
)

func twoSum(nums []int, target int) any {
	A := make([][2]int, len(nums)) // [[0 0] [0 0] [0 0] [0 0] [0 0]]
	for i, num := range nums {
		A[i] = [2]int{num, i} // [[5 0] [3 1] [1 2] [7 3] [4 4]]
	}
	sort.Slice(A, func(i, j int) bool {
		return A[i][0] < A[j][0] //[[1 2] [3 1] [4 4] [5 0] [7 3]]
	})

	i, j := 0, len(nums)-1
	for i < j {
		cur := A[i][0] + A[j][0]
		if cur == target {
			if A[i][1] < A[j][1] {
				return []int{A[i][1], A[j][1]}
			} else {
				return []int{A[j][1], A[i][1]}
			}
		} else if cur < target {
			i++
		} else {
			j--
		}
	}
	return []int{}
}

func solve() interface{} {
	// TODO: implement
	nums := []int{5, 3, 1, 7, 4}
	target := 12
	return twoSum(nums, target)
}

func main() {
	fmt.Println("solve() =>", solve())
}
