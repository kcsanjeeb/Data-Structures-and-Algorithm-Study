// Package main - starter scaffold; replace with your implementation.
package main

import "fmt"

func isAnagram(s string, t string) any {

	if len(s) != len(t) {
		return false
	}
	countS := make(map[rune]int)
	countT := make(map[rune]int)

	for _, ch := range s {
		countS[ch]++ // map[97:2 99:2 101:1 114:2]
	}
	for _, ch := range t {
		countT[ch]++ // map[97:2 99:2 101:1 114:2]
	}

	for char, countInS := range countS {
		if countT[char] != countInS {
			return false
		}
	}

	return true
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
