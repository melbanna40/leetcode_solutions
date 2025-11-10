# 16. 3Sum Closest

## 📖 Problem Description

Given an integer array `nums` of length `n` and an integer `target`, find three integers in `nums` such that the sum is closest to `target`.

Return the sum of the three integers.

You may assume that each input would have exactly one solution.

**Example:**
```
Input: nums = [-1,2,1,-4], target = 1
Output: 2
Explanation: The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
```

**Constraints:**
- `3 <= nums.length <= 500`
- `-1000 <= nums[i] <= 1000`
- `-10^4 <= target <= 10^4`

## 🎯 The Intuition (Explained Simply)

This problem is similar to the classic "3Sum" problem, but instead of finding triplets that sum to exactly zero, we need to find the triplet whose sum is **closest** to a target value.

### Why Sorting + Two Pointers Work

1. **Sorting First**: By sorting the array, we can use the two-pointer technique efficiently
2. **Fix One Element**: For each element at position `i`, we fix it and search for two other elements
3. **Two Pointers**: Use left and right pointers to find the best pair that, combined with `nums[i]`, gives the closest sum to target

### The Clever Logic

- If current sum < target → We need a larger sum → Move left pointer right
- If current sum > target → We need a smaller sum → Move right pointer left
- If current sum == target → Perfect match! Return immediately
- Always track the closest sum we've seen so far

## 🧠 The Technique: Two Pointers (Extended)

This extends the two-pointer technique to work with three elements by fixing one element and using two pointers for the remaining pair.

### When to Use This Pattern:
- ✅ Finding triplets in sorted arrays
- ✅ Problems where you need to find closest/maximum/minimum sum
- ✅ Extending two-pointer technique to three elements
- ✅ Problems that can be reduced to "find closest value"

### Why It's Powerful:
- Reduces time complexity from O(n³) to O(n²)
- Uses minimal extra memory O(1)
- Exploits sorted property to make smart decisions

## 💡 How the Solution Works

```dart
// 1. Sort the array
nums.sort();

// 2. Initialize closest with first three elements
int closest = nums[0] + nums[1] + nums[2];

// 3. Fix one element, use two pointers for the other two
for (int i = 0; i < nums.length - 2; i++) {
  int left = i + 1;
  int right = nums.length - 1;
  
  while (left < right) {
    int tempSum = nums[i] + nums[left] + nums[right];
    
    // Update closest if we found a better sum
    if ((target - tempSum).abs() < (target - closest).abs()) {
      closest = tempSum;
    }
    
    // Adjust pointers
    if (tempSum < target) left++;
    else if (tempSum > target) right--;
    else return target;  // Exact match!
  }
}
```

### Step-by-Step Example

For `nums = [-1, 2, 1, -4]`, `target = 1`:

After sorting: `[-4, -1, 1, 2]`

| i | Left | Right | nums[i] | nums[left] | nums[right] | Sum | Closest | Action |
|---|------|-------|---------|------------|-------------|-----|---------|--------|
| 0 | 1 | 3 | -4 | -1 | 2 | -3 | -3 | -3 < 1 → left++ |
| 0 | 2 | 3 | -4 | 1 | 2 | -1 | -1 | -1 < 1 → left++ |
| 0 | 3 | 3 | -4 | 2 | 2 | 0 | -1 | left >= right, next i |
| 1 | 2 | 3 | -1 | 1 | 2 | 2 | 2 | 2 > 1 → right-- |
| 1 | 2 | 2 | -1 | 1 | 1 | 1 | 2 | left >= right, next i |
| 2 | 3 | 3 | 1 | 2 | 2 | 5 | 2 | left >= right, done |

Final answer: **2** (closest to target 1)

## ⏱️ Complexity Analysis

### Time Complexity: **O(n²)**
- Sorting: O(n log n)
- Outer loop: O(n) iterations
- Inner two-pointer loop: O(n) in worst case
- Total: O(n log n) + O(n²) = **O(n²)** (dominated by nested loops)

### Space Complexity: **O(1)**
- We only use a few variables: `closest`, `i`, `left`, `right`, `tempSum`
- Sorting is done in-place (modifies the input array)
- No extra data structures that grow with input size
- Memory usage is constant regardless of input size

### Comparison with Brute Force

| Approach | Time | Space | Best For |
|----------|------|-------|----------|
| **Sorting + Two Pointers** ⭐ | O(n²) | O(1) | **This problem** ✓ |
| Brute Force | O(n³) | O(1) | Small arrays only |

### Why This is Better Than Brute Force

**Brute Force Approach**: Check every possible triplet
- Time: O(n³) - three nested loops
- Space: O(1)

**Our Approach**:
- Time: O(n²) - much faster for large inputs
- Space: O(1)

For an array of 100 elements:
- Brute force: ~1,000,000 operations
- Our approach: ~10,000 operations
- **100x faster!** 🚀

## 🔑 Key Insights

1. **Sorting is Key**: Without sorting, we can't use the two-pointer technique effectively
2. **Track Closest**: We need to compare absolute differences, not just the sum itself
3. **Early Exit**: If we find an exact match (sum == target), we can return immediately
4. **Pointer Movement**: The sorted property allows us to make smart decisions about which pointer to move

## 🎯 Edge Cases to Consider

1. **Exact match exists**: `[0, 0, 0]`, `target = 0` → Return 0 immediately
2. **All negative numbers**: `[-1, -2, -3]`, `target = -5` → Find closest negative sum
3. **Large target**: `[1, 1, 1]`, `target = 100` → Return sum of smallest elements
4. **Small target**: `[100, 200, 300]`, `target = 1` → Return sum of largest elements
5. **Mixed signs**: `[-1, 2, 1, -4]`, `target = 1` → Need to consider all combinations

## 🤔 Why We Sort

Sorting enables the two-pointer technique:
- After sorting, we know that moving left pointer right increases the sum
- Moving right pointer left decreases the sum
- This allows us to make directional decisions and skip many unnecessary checks

## 🔑 Key Takeaways

1. **Sorting + Two Pointers** is a powerful combination for triplet problems
2. When finding "closest" values, always track the best candidate and compare absolute differences
3. O(n²) is much better than O(n³) for large inputs
4. Early exit optimization (returning exact matches immediately) can improve average-case performance
5. This pattern extends naturally from two-pointer to three-element problems

## 🎮 Try It Yourself

Think about why we can safely skip certain triplets. When we move the left pointer right (because sum < target), are we missing any potential better solutions?

**Hint**: Consider what happens if we kept the left pointer fixed and moved the right pointer. Would we ever find a sum closer to the target?

## 📚 Related Problems

- [15. 3Sum](https://leetcode.com/problems/3sum/) - Find triplets that sum to exactly zero
- [167. Two Sum II - Input Array Is Sorted](https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/) - Two-pointer basics
- [18. 4Sum](https://leetcode.com/problems/4sum/) - Extends this pattern to four elements

## 🔄 Pattern Recognition

This problem demonstrates how to extend the two-pointer technique:
1. **Two Sum**: One loop + two pointers → O(n)
2. **3Sum/3Sum Closest**: One loop to fix element + two pointers → O(n²)
3. **4Sum**: Two loops to fix elements + two pointers → O(n³)

The pattern: For k-sum problems, use (k-2) loops to fix elements + two pointers for the remaining pair.

