---
id: 20251027-000955-14934
title: "Encoding & Decoding"
approach_type: "String Manipulation"
language: "Go"
tags: ["String", "Encoding", "Decoding"]
recommended: true
---

## 🔍 Idea
* Encode a list of strings into a single string by storing lengths and concatenating
* Decode the encoded string back to the original list using stored lengths
* Use "#" as delimiter between metadata (lengths) and data (concatenated strings)

## 🧩 Steps
**Encoding:**
1. Convert each string length to string using `strconv.Itoa()`
2. Join all lengths with "," separator
3. Join all original strings together
4. Combine lengths and concatenated strings with "#" delimiter

**Decoding:**
1. Split encoded string into two parts at first "#" using `SplitN`
2. Split first part into individual size strings
3. For each size, convert to integer and extract corresponding substring
4. Track current position in concatenated string and move pointer forward

---

## 🧮 Complexity

### Time Complexity: O(m)
**Quick Calculation:**
- Encoding: O(m) where m is total characters across all strings
- Decoding: O(m) where m is length of encoded string
- Each character processed once in both operations

### Space Complexity: O(m+n)
**Quick Check:**
- Encoding: O(m+n) for result string and temporary arrays
- Decoding: O(m+n) for result slice and processing
- m = total characters, n = number of strings

| Metric  |  Complexity | Reason |
|---------|-------------|--------|
| **Time**  | O(m) | Character processing |
| **Space** | O(m+n) | String storage + array overhead |