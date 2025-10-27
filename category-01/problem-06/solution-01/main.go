// Package main - starter scaffold; replace with your implementation.
package main

import (
	"fmt"
	"strconv"
	"strings"
)

type Solution struct{}

func (s *Solution) Encode(strs []string) string {
	if len(strs) == 0 {
		return ""
	}
	var sizes []string
	for _, str := range strs {
		sizes = append(sizes, strconv.Itoa(len(str)))
	}
	return strings.Join(sizes, ",") + "#" + strings.Join(strs, "")
}

func (s *Solution) Decode(encoded string) []string {
	if encoded == "" {
		return []string{}
	}
	parts := strings.SplitN(encoded, "#", 2) // divides into 2 parts (cuts)
	fmt.Println("parts", parts)

	sizes := strings.Split(parts[0], ",")
	fmt.Println("sizes", sizes)

	var res []string
	i := 0
	for _, sz := range sizes {
		if sz == "" {
			continue
		}
		length, _ := strconv.Atoi(sz)
		res = append(res, parts[1][i:i+length]) // Extract i+len chars from position i
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
