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

	return []string{}
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

// if len(strs) == 0 {
// 	return ""
// }
// var sizes []string
// for _, str := range strs {
// 	sizes = append(sizes, strconv.Itoa(len(str)))
// }
// return strings.Join(sizes, ",") + "#" + strings.Join(strs, "")

// 	if encoded == "" {
// 	return []string{}
// }
// parts := strings.SplitN(encoded, "#", 2)
// if len(parts) != 2 {
// 	return []string{}
// }
// sizes := strings.Split(parts[0], ",")
// var res []string
// i := 0
// for _, sz := range sizes {
// 	if sz == "" {
// 		continue
// 	}
// 	length, err := strconv.Atoi(sz)
// 	if err != nil || length < 0 {
// 		continue // Skip invalid sizes
// 	}
// 	if i+length > len(parts[1]) {
// 		break // Prevent index out of bounds
// 	}
// 	res = append(res, parts[1][i:i+length])
// 	i += length
// }
// return res
