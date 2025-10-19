// Package main - starter scaffold; replace with your implementation.
package main

import (
	"fmt"
	"sort"
)

func isAnagram(s, t string) any {

	sRunes := []rune(s) // [114 97 99 101 99 97 114] // O(n) space, O(n) time
	tRunes := []rune(t) // [99 97 114 114 97 99 101] // O(n) space, O(n) time

	sort.Slice(sRunes, func(i, j int) bool { // O(n log n) time, O(log n) space
		return sRunes[i] < sRunes[j] // [97 97 99 99 101 114 114]
	})

	sort.Slice(tRunes, func(i, j int) bool { // O(m log m) time, O(log m) space
		return tRunes[i] < tRunes[j] // [97 97 99 99 101 114 114]
	})

	for i := range sRunes { // O(n) time, O(1) space
		if sRunes[i] != tRunes[i] { // O(1) time, O(1) space
			return false // O(1) time, O(1) space
		}
	}

	return true // time: O(1) // space: O(1)
}

func solve() interface{} {
	// TODO: implement
	s := "racecar"
	t := "carrace"
	return isAnagram(s, t)
}

func main() {
	fmt.Println("solve() =>", solve())
}
