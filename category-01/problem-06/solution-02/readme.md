---
id: 20251027-114101-9688
title: "Encoding & Decoding (Optimal)"
approach_type: "String Manipulation with Length Prefix"
language: "Go"
tags: ["String", "Encoding", "Decoding", "Optimal"]
recommended: false
---

## 🔍 Idea
* Encode each string with its length as a prefix followed by a delimiter
* Use format: "length#string" for each string, concatenated together
* Decode by parsing length first, then extracting exact number of characters

## 🧩 Steps
**Encoding:**
1. For each string, convert its length to string
2. Append "#" delimiter after length
3. Append the actual string
4. Concatenate all encoded pieces together

**Decoding:**
1. Use pointer `i` to traverse encoded string
2. Find next "#" delimiter to get length prefix
3. Convert length substring to integer
4. Extract exactly `length` characters after "#"
5. Move pointer forward and repeat

---

## 🧮 Complexity

### Time Complexity: O(m)
**Quick Calculation:**
- Encoding: O(m) where m is total characters across all strings
- Decoding: O(m) where m is length of encoded string
- Each character processed once in linear pass

### Space Complexity: O(m+n)
**Quick Check:**
- Encoding: O(m+n) for result string (m chars + n delimiters)
- Decoding: O(m+n) for result slice storing all strings
- m = total characters, n = number of strings

| Metric  |  Complexity | Reason |
|---------|-------------|--------|
| **Time**  | O(m) | Linear processing |
| **Space** | O(m+n) | String storage + array overhead |