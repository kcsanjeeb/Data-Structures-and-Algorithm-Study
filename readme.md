# 🧩 DSA Study using Golang

This repository contains structured lessons for mastering **Data Structures and Algorithms (DSA)** using **Golang**.  
Each **category** (e.g., Arrays & Hashing, Two Pointers, etc.) contains multiple **problems**, and each problem has one or more **solutions** exploring different algorithmic strategies.

---

<!-- TOC:START -->
## 🧭 Table of Contents (auto-generated)

### 1. [Category-01 - Arrays & Hashing](./category-01/readme.md)
| Problem | Solution Approaches | Time Complexity | Space Complexity |
| --- | --- | --- | --- |
| [Problem-01: Contains Duplicate](./category-01/problem-01/readme.md) | [Brute Force](./category-01/problem-01/solution-01/readme.md) | O(n²) | O(1) |
|  | [Sorting](./category-01/problem-01/solution-02/readme.md) | O(n log n)  | O(1) |
|  | [✅ Hash Set](./category-01/problem-01/solution-03/readme.md) | O(n) | O(n) |
|  | [Hash Set Length](./category-01/problem-01/solution-04/readme.md) | O(n)  | O(n) |
| [Problem-02: Valid Anagram](./category-01/problem-02/readme.md) | [Sorting](./category-01/problem-02/solution-01/readme.md) | O(n log n + m log m) | O(n + m) |
|  | [Hash Map](./category-01/problem-02/solution-02/readme.md) |  |  |
|  | [Hash Table (Using Array)](./category-01/problem-02/solution-03/readme.md) |  |  |
| [Problem-03: Two Sum](./category-01/problem-03/readme.md) | [Brute Force](./category-01/problem-03/solution-01/readme.md) |  |  |
|  | [Sorting](./category-01/problem-03/solution-02/readme.md) |  |  |
|  | [Hash Map (Two Pass)](./category-01/problem-03/solution-03/readme.md) |  |  |
|  | [Hash Map (One Pass)](./category-01/problem-03/solution-04/readme.md) |  |  |

### 2. [Category-02 - Two Pointers](./category-02/readme.md)
| Problem | Solution Approaches | Time Complexity | Space Complexity |
| --- | --- | --- | --- |

### 3. [Category-03 - Stack](./category-03/readme.md)
| Problem | Solution Approaches | Time Complexity | Space Complexity |
| --- | --- | --- | --- |

### 4. [Category-04 - Binary Search](./category-04/readme.md)
| Problem | Solution Approaches | Time Complexity | Space Complexity |
| --- | --- | --- | --- |

### 5. [Category-05 - Sliding Window](./category-05/readme.md)
| Problem | Solution Approaches | Time Complexity | Space Complexity |
| --- | --- | --- | --- |

### 6. [Category-06 - Linked List](./category-06/readme.md)
| Problem | Solution Approaches | Time Complexity | Space Complexity |
| --- | --- | --- | --- |

### 7. [Category-07 - Trees](./category-07/readme.md)
| Problem | Solution Approaches | Time Complexity | Space Complexity |
| --- | --- | --- | --- |

### 8. [Category-08 - Tries](./category-08/readme.md)
| Problem | Solution Approaches | Time Complexity | Space Complexity |
| --- | --- | --- | --- |

### 9. [Category-09 - Backtracking](./category-09/readme.md)
| Problem | Solution Approaches | Time Complexity | Space Complexity |
| --- | --- | --- | --- |

### 10. [Category-10 - Heap , Priority Queue](./category-10/readme.md)
| Problem | Solution Approaches | Time Complexity | Space Complexity |
| --- | --- | --- | --- |

### 11. [Category-11 - Graphs](./category-11/readme.md)
| Problem | Solution Approaches | Time Complexity | Space Complexity |
| --- | --- | --- | --- |

### 12. [Category-12 - 1-D Dynamic Programming](./category-12/readme.md)
| Problem | Solution Approaches | Time Complexity | Space Complexity |
| --- | --- | --- | --- |

### 13. [Category-13 - Intervals](./category-13/readme.md)
| Problem | Solution Approaches | Time Complexity | Space Complexity |
| --- | --- | --- | --- |

### 14. [Category-14 - Greedy](./category-14/readme.md)
| Problem | Solution Approaches | Time Complexity | Space Complexity |
| --- | --- | --- | --- |

### 15. [Category-15 - Advanced Graphs](./category-15/readme.md)
| Problem | Solution Approaches | Time Complexity | Space Complexity |
| --- | --- | --- | --- |

### 16. [Category-16 - 2-D Dynamic Programming](./category-16/readme.md)
| Problem | Solution Approaches | Time Complexity | Space Complexity |
| --- | --- | --- | --- |

### 17. [Category-17 - Bit Manipulation](./category-17/readme.md)
| Problem | Solution Approaches | Time Complexity | Space Complexity |
| --- | --- | --- | --- |

### 18. [Category-18 - Bit Manipulation](./category-18/readme.md)
| Problem | Solution Approaches | Time Complexity | Space Complexity |
| --- | --- | --- | --- |

### 19. [Category-19 - Math & Geometry](./category-19/readme.md)
| Problem | Solution Approaches | Time Complexity | Space Complexity |
| --- | --- | --- | --- |

<!-- TOC:END -->

---

## 📚 Theory
* [Complexity Calculation](./theory/time-complexity.mdx)
* [Brute Force](https://www.geeksforgeeks.org/dsa/brute-force-approach-and-its-pros-and-cons)
* [Hash Table and Hash Function](https://www.youtube.com/watch?v=KyUTuwz_b7Q)

## ⚙️ How to Run Any Solution

```bash
# Example: run solution-01 of problem-01 in category-01
cd category-01/problem-01/solution-01
go run main.go
```

## 📁 Repository Structure

## How to install & use
### Fully interactive (asks everything)

```bash
./dsa.sh category --interactive         # To create category
./dsa.sh problem --interactive          # To create problem
./dsa.sh solution --interactive         # To create solution
```

```bash
# Save
nano dsa.sh   # paste the script, save

# Make executable
chmod +x dsa.sh

# Create a category
./dsa.sh category --cat 1 --label "Arrays & Hashing"

# Add a problem (auto-picks next problem-XX)
./dsa.sh problem --cat 1 --prob auto --title "Contains Duplicate" --difficulty Easy --tags "Arrays,Hashing"

# Add a second problem later (no need to touch existing files)
./dsa.sh problem --cat 1 --prob auto --title "Valid Anagram" --difficulty Easy --tags "Arrays,Hashing,Strings"

# Add solutions any time (auto-picks next solution-XX)
./dsa.sh solution --cat 1 --prob 1 --sol auto --title "Solution-01: Brute Force" --approach "Brute Force" --tags "Brute Force,Intro"
./dsa.sh solution --cat 1 --prob 1 --sol auto --title "Solution-02: Sorting" --approach "Sorting" --tags "Sorting,Array"

# Fully interactive (asks everything)
./dsa.sh problem --interactive
./dsa.sh solution --interactive
```



---