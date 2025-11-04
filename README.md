# 🎯 LeetCode Solutions in Dart

A collection of LeetCode problem solutions implemented in Dart, with clear explanations and complexity analysis.

## 📁 Project Structure

Each problem is organized in its own directory under `problems/` with:
- `solution.dart` - The solution code
- `README.md` - Problem description, approach explanation, and complexity analysis

## 🚀 Getting Started

### Prerequisites
- Dart SDK installed ([Download here](https://dart.dev/get-dart))

### Running a Solution

```bash
# Navigate to the project directory
cd leetcode_solutions

# Run a specific solution
dart run problems/011_container_with_most_water/solution.dart
```

## 📚 Problems Solved

| # | Problem | Difficulty | Technique | Time Complexity | Space Complexity |
|---|---------|-----------|-----------|-----------------|------------------|
| 11 | [Container With Most Water](problems/011_container_with_most_water/README.md) | Medium | Two Pointers | O(n) | O(1) |
| 167 | [Two Sum II - Input Array Is Sorted](problems/167_two_sum_ii/README.md) | Medium | Two Pointers | O(n) | O(1) |

## 🚀 Coding Interview Patterns Roadmap (7-Week Plan)

### 🎯 Goal
Master the **core problem-solving patterns** used in technical interviews without drowning in hundreds of random LeetCode questions.  

At the end of this roadmap, you will:
- Recognize the key **coding patterns** behind most algorithm problems.
- Confidently choose the right pattern under interview pressure.
- Build your own reusable "pattern library" with notes and pseudo-code.

---

## 🗓️ 7-Week Plan Overview

Each week focuses on **one pattern**, with time to:
1. Understand the theory and intuition.  
2. Solve 3–5 targeted problems.  
3. Write pseudo-code and document when to apply it.  
4. Review and reflect.

---

### 🧩 Week 1 – Sliding Window
**Progress:** `░░░ 0/3 (0%)`

**Concept:** Efficiently handle contiguous subarrays or substrings with dynamic start/end indices.  
**When to Use:** Problems involving subarrays/substrings of variable length, tracking sums, or unique characters.  

**LeetCode Practice:**
- [ ] [3. Longest Substring Without Repeating Characters](https://leetcode.com/problems/longest-substring-without-repeating-characters/)
- [ ] [209. Minimum Size Subarray Sum](https://leetcode.com/problems/minimum-size-subarray-sum/)
- [ ] [1004. Max Consecutive Ones III](https://leetcode.com/problems/max-consecutive-ones-iii/)

---

### 🧭 Week 2 – Two Pointers
**Progress:** `██░ 2/3 (67%)`

**Concept:** Use two indices moving at different speeds or from opposite directions to find pairs, midpoints, or partitions.  
**When to Use:** Sorted arrays, linked lists, or problems involving pair matching and array modification.  

**LeetCode Practice:**
- [x] [167. Two Sum II – Input Array Is Sorted](https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/)
- [ ] [15. 3Sum](https://leetcode.com/problems/3sum/)
- [x] [11. Container With Most Water](https://leetcode.com/problems/container-with-most-water/)

---

### 🌊 Week 3 – DFS / BFS (Graph & Matrix Traversal)
**Progress:** `░░░ 0/3 (0%)`

**Concept:** Explore nodes (or cells) systematically using recursion or queues.  
**When to Use:** Graphs, trees, or grids where you need to traverse or count connected regions.  

**LeetCode Practice:**
- [ ] [200. Number of Islands](https://leetcode.com/problems/number-of-islands/)
- [ ] [695. Max Area of Island](https://leetcode.com/problems/max-area-of-island/)
- [ ] [102. Binary Tree Level Order Traversal (BFS)](https://leetcode.com/problems/binary-tree-level-order-traversal/)

---

### ⚙️ Week 4 – HashMap Patterns
**Progress:** `░░░ 0/3 (0%)`

**Concept:** Store elements and their counts, indices, or states for O(1) lookups.  
**When to Use:** Problems requiring tracking seen elements, duplicates, or frequency counts.  

**LeetCode Practice:**
- [ ] [1. Two Sum](https://leetcode.com/problems/two-sum/)
- [ ] [387. First Unique Character in a String](https://leetcode.com/problems/first-unique-character-in-a-string/)
- [ ] [49. Group Anagrams](https://leetcode.com/problems/group-anagrams/)

---

### 🧱 Week 5 – Merge Intervals
**Progress:** `░░░ 0/3 (0%)`

**Concept:** Sort intervals and merge overlapping ones to simplify schedules or time ranges.  
**When to Use:** Calendar merging, overlapping events, or segment compression.  

**LeetCode Practice:**
- [ ] [56. Merge Intervals](https://leetcode.com/problems/merge-intervals/)
- [ ] [57. Insert Interval](https://leetcode.com/problems/insert-interval/)
- [ ] [435. Non-overlapping Intervals](https://leetcode.com/problems/non-overlapping-intervals/)

---

### 🌀 Week 6 – Fast & Slow Pointers
**Progress:** `░░░ 0/3 (0%)`

**Concept:** Use two pointers with different speeds to detect cycles or locate midpoints.  
**When to Use:** Linked list cycle detection, palindrome checking, or middle element finding.  

**LeetCode Practice:**
- [ ] [141. Linked List Cycle](https://leetcode.com/problems/linked-list-cycle/)
- [ ] [142. Linked List Cycle II](https://leetcode.com/problems/linked-list-cycle-ii/)
- [ ] [876. Middle of the Linked List](https://leetcode.com/problems/middle-of-the-linked-list/)

---

### 🧠 Week 7 – Dynamic Programming (Intro)
**Progress:** `░░░ 0/3 (0%)`

**Concept:** Break problems into smaller subproblems and store results to avoid recomputation.  
**When to Use:** Problems involving optimal choices, counts, or combinations with overlapping subproblems.  

**LeetCode Practice:**
- [ ] [70. Climbing Stairs](https://leetcode.com/problems/climbing-stairs/)
- [ ] [322. Coin Change](https://leetcode.com/problems/coin-change/)
- [ ] [198. House Robber](https://leetcode.com/problems/house-robber/)

---

## ✅ Weekly Checklist
- [ ] Study the concept deeply (1–2 hrs)  
- [ ] Watch or read 1 tutorial explaining the intuition  
- [ ] Solve 3–5 related LeetCode problems  
- [ ] Write pseudo-code and your own summary  
- [ ] End the week with a mini-review (15 min)

---

## 🔁 After Week 7
Continue with advanced patterns:
- Week 8: **Cyclic Sort, Subsets, Modified Binary Search**  
- Week 9: **Top K Elements, Heaps, K-way Merge**  
- Week 10: **Bitwise, Topological Sort, Knapsack, LCS**

---

## 🧭 Final Outcome
By following this plan:
- You'll have internalized **7 core patterns** that appear in 70–80% of interview questions.  
- You'll think in **patterns and blueprints**, not in memorized code.  
- You'll have your own **Pattern Notebook** ready for any coding interview.

---

### 💡 Pro Tip
> "Smart coders don't memorize — they generalize.  
> A good pattern is worth a hundred solutions."

## 📝 Notes

This repository is designed to help understand not just the solutions, but the thought process and techniques behind them. Each solution includes:
- Clear, readable code following Dart best practices
- Detailed explanations suitable for beginners
- Time and space complexity analysis
- The algorithmic technique used

## 🤝 Contributing

Feel free to add more solutions following the same structure!

## 📄 License

This project is for educational purposes.
