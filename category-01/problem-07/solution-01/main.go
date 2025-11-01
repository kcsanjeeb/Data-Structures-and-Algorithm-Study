// Package main - starter scaffold; replace with your implementation.
package main

import "fmt"

func productExceptSelf(nums []int) []int {
	n := len(nums)
	res := make([]int, n)
	for i := 0; i < n; i++ {
		prod := 1
		for j := 0; j < n; j++ {
			if i == j {
				continue
			}
			prod *= nums[j]
		}
		res[i] = prod
	}
	return res
}

func solve() interface{} {
	// TODO: implement
	nums := []int{1, 2, 4, 6}
	return productExceptSelf(nums)
}

func main() {

	fmt.Println("solve() =>", solve())
}
