// Package main - starter scaffold; replace with your implementation.
package main

import (
	"fmt"
	"strconv"
)

type Solution struct{}

func (s *Solution) Encode(strs []string) string {
	res := ""
	for _, str := range strs {
		res += strconv.Itoa(len(str)) + "#" + str
	}
	fmt.Println(res)
	return res
}

func (s *Solution) Decode(encoded string) []string {
	res := []string{}
	i := 0
	for i < len(encoded) {
		j := i
		for encoded[j] != '#' {
			j++
		}
		length, _ := strconv.Atoi(encoded[i:j])
		i = j + 1
		res = append(res, encoded[i:i+length])
		i += length
	}
	return res
}

func main() {
	sol := &Solution{}

	// Test the encode/decode functionality
	testStrs := []string{"hello", "world", "go"}
	encoded := sol.Encode(testStrs)
	fmt.Println("Encoded:", encoded)

	decoded := sol.Decode(encoded)
	fmt.Println("Decoded:", decoded)

	// // Test edge cases
	// empty := sol.Encode([]string{})
	// fmt.Println("Empty encode:", empty)
	// fmt.Println("Empty decode:", sol.Decode(empty))

	// withEmptyStrs := sol.Encode([]string{"", "test", ""})
	// fmt.Println("With empty strings encoded:", withEmptyStrs)
	// fmt.Println("With empty strings decoded:", sol.Decode(withEmptyStrs))
}
