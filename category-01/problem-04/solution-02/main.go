// Package main - starter scaffold; replace with your implementation.
package main

import "fmt"

func groupAnagrams(strs []string) [][]string {
	res := make(map[[26]int][]string)

	for _, s := range strs {
		var count [26]int
		for _, c := range s {
			count[c-'a']++
		}
		res[count] = append(res[count], s)
	}
	fmt.Println(res)
	var result [][]string

	for _, group := range res {
		result = append(result, group)
	}
	return result
}

func solve() interface{} {
	// TODO: implement
	strs := []string{"eat", "tea", "tan", "ate", "nat", "bat"}
	return groupAnagrams(strs)
}

func main() {
	fmt.Println("solve() =>", solve())
}
