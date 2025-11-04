# 167. Two Sum II - Input Array Is Sorted

## 📖 Problem Description

Given a **1-indexed** array of integers `numbers` that is already sorted in non-decreasing order, find two numbers such that they add up to a specific `target` number. 

Return the indices of the two numbers (1-indexed) as an integer array `[index1, index2]` of length 2.

**Example:**
```
Input: numbers = [2,7,11,15], target = 9
Output: [1,2]
Explanation: The sum of 2 and 7 is 9. Therefore, index1 = 1, index2 = 2.
```

**Constraints:**
- `2 <= numbers.length <= 3 * 10^4`
- `-1000 <= numbers[i] <= 1000`
- `numbers` is sorted in non-decreasing order
- `-1000 <= target <= 1000`
- The tests are generated such that there is exactly one solution

## 🎯 The Intuition (Explained Simply)

The key insight here is that the array is **already sorted**. This sorted property is what makes the two-pointer technique perfect for this problem!

### Why Two Pointers Work Here

Imagine you're trying to find two numbers that add up to a target. You have two options:
1. **Brute Force**: Check every pair → O(n²) time
2. **Hash Map**: Store seen elements → O(n) time, O(n) space
3. **Two Pointers**: Use sorted property → O(n) time, O(1) space ⭐

### The Clever Logic

Since the array is sorted, we can make smart decisions about which direction to move:

1. **Start Wide**: Put one pointer at the beginning (`left = 0`) and one at the end (`right = n-1`)

2. **Compare and Move**:
   - If `sum < target` → We need a **larger** sum → Move `left` right (bigger number)
   - If `sum > target` → We need a **smaller** sum → Move `right` left (smaller number)
   - If `sum == target` → Found it! Return the 1-indexed positions

3. **Why This Works**: The sorted property guarantees that:
   - Moving left pointer right always increases the sum
   - Moving right pointer left always decreases the sum
   - We can safely eliminate half the remaining possibilities with each move

## 🧠 The Technique: Two Pointers

The **Two Pointers** technique uses two references to iterate through a data structure, typically from different ends or at different speeds.

### When to Use Two Pointers:
- ✅ Searching pairs in a **sorted array**
- ✅ Finding a subarray with certain properties
- ✅ Optimizing brute force solutions that check all pairs
- ✅ Problems where you can make directional decisions based on current values

### Why It's Powerful Here:
- Reduces time complexity from O(n²) to O(n)
- Uses minimal extra memory O(1) - no hash map needed
- Exploits the sorted property directly

## 💡 How the Solution Works

```dart
int left = 0;                    // Start at the beginning
int right = numbers.length - 1;  // Start at the end

while (left < right) {
  int sum = numbers[left] + numbers[right];
  
  if (sum == target) {
    return [left + 1, right + 1];  // 1-indexed!
  } else if (sum < target) {
    left++;   // Need larger sum → move left right
  } else {
    right--;  // Need smaller sum → move right left
  }
}
```

### Step-by-Step Example

For `numbers = [2, 7, 11, 15]`, `target = 9`:

| Step | Left | Right | Numbers[left] | Numbers[right] | Sum | Action |
|------|------|-------|---------------|----------------|-----|--------|
| 1 | 0 | 3 | 2 | 15 | 17 | 17 > 9 → right-- |
| 2 | 0 | 2 | 2 | 11 | 13 | 13 > 9 → right-- |
| 3 | 0 | 1 | 2 | 7 | 9 | 9 == 9 → Found! |

Final answer: **[1, 2]** (1-indexed)

## 🔑 Critical Detail: 1-Indexed Return

⚠️ **Important Gotcha**: The problem asks for 1-indexed positions, not 0-indexed!

- Internal logic uses 0-indexed: `left = 0, right = 1`
- Return must be 1-indexed: `[left + 1, right + 1]` = `[1, 2]`

This is a common source of bugs in interviews!

## ⏱️ Complexity Analysis

### Time Complexity: **O(n)**
- We visit each element at most once
- The two pointers move towards each other, never backwards
- Each iteration does constant work: O(1)
- Total: O(n) where n is the length of the array

### Space Complexity: **O(1)**
- We only use a few variables: `left`, `right`, `sum`
- No extra data structures that grow with input size
- Memory usage is constant regardless of input size

### Comparison with Alternatives

| Approach | Time | Space | Best For |
|----------|------|-------|----------|
| **Two Pointer** ⭐ | O(n) | O(1) | **Sorted arrays** ✓ |
| Binary Search | O(n log n) | O(1) | Already using binary search elsewhere |
| Hash Map | O(n) | O(n) | Unsorted arrays |

### Why Two Pointers Beats Hash Map Here

While both have O(n) time complexity:
- **Two Pointers**: O(1) space - exploits sorted property
- **Hash Map**: O(n) space - wastes the sorted constraint

The two-pointer solution is optimal in both time and space!

## 🎯 Key Edge Cases

The solution handles all these naturally:

1. **Exact two elements**: `[1, 2]`, `target = 3` → `[1, 2]`
2. **Duplicates**: `[1, 2, 2, 3]`, `target = 4` → `[1, 4]` or `[2, 3]`
3. **Negative numbers**: `[-1, 0, 1]`, `target = 0` → `[1, 3]`
4. **Large gaps**: `[1, 1000]`, `target = 1001` → `[1, 2]`

## 🤔 When Two Pointers Fail

This pattern **requires sorted data**. If the array were unsorted:
- Sorting first → O(n log n), defeats the purpose
- Hash map becomes optimal → O(n) time, O(n) space

**Key Takeaway**: Always ask "what property of the input can I exploit?" Here, sortedness → two pointers!

## 🔑 Key Takeaways

1. **Two pointers** is perfect for sorted arrays
2. The sorted property allows us to make directional decisions
3. O(1) space is better than O(n) space when possible
4. Always check if the problem requires 0-indexed or 1-indexed return values
5. Linear time O(n) beats quadratic time O(n²) for large inputs

## 🎮 Try It Yourself

Think about why we can safely skip checking all pairs. When we move the pointer at the smaller end (if sum < target), are we missing any potential solutions?

**Hint**: Consider what happens if we kept the left pointer fixed and moved the right pointer left instead. Would we ever find a valid pair?

## 📚 Related Problems

- [1. Two Sum](https://leetcode.com/problems/two-sum/) - Unsorted array (use hash map)
- [15. 3Sum](https://leetcode.com/problems/3sum/) - Extends two-pointer technique
- [11. Container With Most Water](https://leetcode.com/problems/container-with-most-water/) - Another two-pointer problem

