// SORTING
// Package main - starter scaffold; replace with your implementation.
package main

import (
	"fmt"
	"sort"
)

func groupAnagrams(strs []string) [][]string {
	res := make(map[string][]string)
	for _, s := range strs { // time: O(m × n log n), space: O(1)
		sortedS := sortString(s)               // time: O(n log n), space: O(n)
		res[sortedS] = append(res[sortedS], s) // time: O(1), space: O(n)
	}
	fmt.Println(res)
	var result [][]string
	for _, group := range res { // time : O(m) , space: O(1)
		result = append(result, group)
	}
	return result
}

func sortString(s string) string {
	characters := []rune(s)                      // time: O(n), space: O(n)
	sort.Slice(characters, func(i, j int) bool { // time: O(n log n), space: O(log n)
		return characters[i] < characters[j]
	})
	return string(characters) // time: O(n), space: O(n)
}

func solve() interface{} {
	// TODO: implement
	strs := []string{"eat", "tea", "tan", "ate", "nat", "bat"}
	return groupAnagrams(strs)
}

func main() {
	fmt.Println("solve() =>", solve())
}
