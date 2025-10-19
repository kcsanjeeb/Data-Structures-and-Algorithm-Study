# 🧩 DSA Study using Golang

This repository contains structured lessons for mastering **Data Structures and Algorithms (DSA)** using **Golang**.  
Each **category** (e.g., Arrays & Hashing, Two Pointers, etc.) contains multiple **problems**, and each problem has one or more **solutions** exploring different algorithmic strategies.

---

## 🧭 Table of Contents

| Category | Problem | Solution Approaches |
|-----------|----------|---------------------|
| [Category-01: Arrays & Hashing](./category-01/readme.md) | [Problem-01: Contains Duplicate](./category-01/problem-01/readme.md) | Brute Force, Sorting |
|  | [Problem-02: Valid Anagram](./category-01/problem-02/readme.md) | Sorting, Hash Map |
| [Category-02: Two Pointers](./category-02/readme.md) | [Problem-01](./category-02/problem-01/readme.md) | Two Pointer, Optimized |
|  | [Problem-02](./category-02/problem-02/readme.md) | Variation-1, Variation-2 |

---
## 🧭 Table of Contents

### 1. [Category-01: Arrays & Hashing](./category-01/readme.md)
| Problem | Solution Approaches | Time Complexity | Space Complexity | 
| --- | ---- | --- | --- |
| [Problem-01: Contains Duplicate](./category-01/problem-01/readme.md) | [Solution-01: Brute Force](./category-01/problem-01/solution-01/readme.go) | O(n+m) | O(1) | 
|  | [Solution-02: Sorting](./category-01/problem-01/solution-02/readme.md) | | O(n+m) | O(1) | 
| [Problem-02: Valid Anagram](./category-01/problem-02/readme.md) | [Solution-01: Sorting](./category-01/problem-02/solution-01/readme.go) | O(n+m) | O(1) | 
|  | [Solution-02: Hash Map](./category-01/problem-02/solution-02/readme.go) | O(n+m) | O(1) | 

### 2. [Category-02: Two Pointers]()

## ⚙️ How to Run Any Solution

```bash
# Example: run solution-01 of problem-01 in category-01
cd category-01/problem-01/solution-01
go run main.go
```

## 📁 Repository Structure

```bash
.
├── backup
│   └── dynamic-array.ipynb
├── category-01                     # Arrays & Hashing
│   ├── problem-01                  # Contains Duplicate
│   │   ├── readme.md   
│   │   ├── solution-01             # Brute Force
│   │   │   ├── main.go
│   │   │   └── readme.go
│   │   └── solution-02             # Sorting
│   │       ├── main.go
│   │       └── readme.md
│   ├── problem-02                  # Valid Anagram
│   │   ├── readme.md
│   │   ├── solution-01             # Sorting
│   │   │   ├── main.go
│   │   │   └── readme.go   
│   │   └── solution-02             # Hash Map
│   │       ├── main.go
│   │       └── readme.md
│   └── readme.md
├── category-02
│   ├── problem-01
│   │   ├── readme.md
│   │   ├── solution-01
│   │   │   ├── main.go
│   │   │   └── readme.go
│   │   └── solution-02
│   │       ├── main.go
│   │       └── readme.go
│   ├── problem-02
│   │   ├── readme.md
│   │   ├── solution-01
│   │   │   ├── main.go
│   │   │   └── readme.go
│   │   └── solution-02
│   │       ├── main.go
│   │       └── readme.md
│   └── readme.md
├── push.sh
└── readme.md
```

---