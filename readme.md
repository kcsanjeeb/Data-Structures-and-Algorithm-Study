# 🧩 DSA Study using Golang

This repository contains structured lessons for mastering **Data Structures and Algorithms (DSA)** using **Golang**.  
Each **category** (e.g., Arrays & Hashing, Two Pointers, etc.) contains multiple **problems**, and each problem has one or more **solutions** exploring different algorithmic strategies.

---

<!-- TOC:START -->
## 🧭 Table of Contents (auto-generated)

### 1. [Category-01 - CategoryA](./category-01/readme.md)
| Problem | Solution Approaches | Time Complexity | Space Complexity |
| --- | --- | --- | --- |
| [Problem-01: ProblemA](./category-01/problem-01/readme.md) | [SolutionA](./category-01/problem-01/solution-01/readme.md) |  |  |
|  | [SolutionB](./category-01/problem-01/solution-02/readme.md) |  |  |
| [Problem-02: ProblemB](./category-01/problem-02/readme.md) | [SolutionA](./category-01/problem-02/solution-01/readme.md) |  |  |
|  | [SolutionB](./category-01/problem-02/solution-02/readme.md) |  |  |
|  | [SolutionC](./category-01/problem-02/solution-03/readme.md) |  |  |

### 2. [Category-02 - CategoryB](./category-02/readme.md)
| Problem | Solution Approaches | Time Complexity | Space Complexity |
| --- | --- | --- | --- |
| [Problem-01: ProblemA](./category-02/problem-01/readme.md) | [SolutionA](./category-02/problem-01/solution-01/readme.md) |  |  |
| [Problem-02: ProblemB](./category-02/problem-02/readme.md) | [SolutionB](./category-02/problem-02/solution-01/readme.md) |  |  |

<!-- TOC:END -->

---

## 🧭 Table of Contents

### 1. [Category-01: Arrays & Hashing](./category-01/readme.md)
| Problem | Solution Approaches | Time Complexity | Space Complexity | 
| --- | ---- | --- | --- |
| [Problem-01: Contains Duplicate](./category-01/problem-01/readme.md) | [Solution-01: Brute Force](./category-01/problem-01/solution-01/readme.go) | O(n+m) | O(1) | 
|  | [Solution-02: Sorting](./category-01/problem-01/solution-02/readme.md) |  O(n+m) | O(1) | 
| [Problem-02: Valid Anagram](./category-01/problem-02/readme.md) | [Solution-01: Sorting](./category-01/problem-02/solution-01/readme.go) | O(n+m) | O(1) | 
|  | [Solution-02: Hash Map](./category-01/problem-02/solution-02/readme.go) | O(n) | O(1) | 

### 2. [Category-02: Two Pointers]()
| Problem | Solution Approaches | Time Complexity | Space Complexity | 
| --- | ---- | --- | --- |
| [Problem-01: Valid Palindrome](./category-02/problem-01/readme.md) | [Solution-01: Reverse String](./category-02/problem-01/solution-01/readme.go) | O(n+m) | O(1) | 
|  | [Solution-02: Two Pointers](./category-02/problem-01/solution-02/readme.go) | O(n) | O(1) |


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