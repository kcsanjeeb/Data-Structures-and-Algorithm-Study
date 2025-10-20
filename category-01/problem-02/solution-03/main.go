// Package main - starter scaffold; replace with your implementation.
package main

import "fmt"

func isAnagram(s, t string) bool {
	if len(s) != len(t) {
		return false // time O(1) space O(1)
	}

	count := [26]int{} // time O(1), space O(1) fixed size array
	// fmt.Println("Initial array : ", count)
	// fmt.Println("s : ", s)
	// fmt.Println("s : ", t)

	for i := 0; i < len(s); i++ { // time O(n), space O(1) - only loop variable
		count[s[i]-'a']++ // time O(1), space O(1) - array access and increment
		// fmt.Println("First :", count)
		count[t[i]-'a']-- // time O(1), space O(1) - array access and increment
		// fmt.Println("Second :", count)
	}

	for _, val := range count { // time O(26) = O(1), space O(1) - loop variable
		if val != 0 { // time O(1), space O(1) - comparison
			return false // time O(1), space O(1)
		}
	}

	return true // time O(1), space O(1)
}

func solve() interface{} {
	// TODO: implement
	s := "tea"
	t := "eat"
	return isAnagram(s, t)
}

func main() {
	fmt.Println("solve() =>", solve())
}
