# 11. Container With Most Water

## 📖 Problem Description

You are given an array of integers `height` where each element represents the height of a vertical line. Imagine these lines are standing up from the ground at positions 0, 1, 2, etc. 

Your goal is to find two lines that, together with the ground (x-axis), can hold the most water.

**Example:**
```
Input: height = [1,8,6,2,5,4,8,3,7]
Output: 49

Explanation: The lines at index 1 (height=8) and index 8 (height=7) 
form a container that can hold 49 units of water.
```

## 🎯 The Intuition (Explained Simply)

Imagine you're holding a rectangular container. The amount of water it can hold depends on two things:

1. **Width**: How far apart the two sides are
2. **Height**: The height of the *shorter* side (because water spills over the shorter side!)

### The Clever Trick: Two Pointers

Instead of trying every possible pair (which would take forever), we use a smart approach:

1. **Start Wide**: Put one pointer at the very beginning and one at the very end. This gives us maximum width.

2. **Move Smartly**: The water height is limited by the shorter line. So:
   - If the left line is shorter, move the left pointer inward (looking for a taller line)
   - If the right line is shorter, move the right pointer inward

3. **Why This Works**: By moving the shorter line's pointer, we have a chance of finding a taller line that could give us more area. Moving the taller line's pointer would only make things worse (less width, same or less height).

## 🧠 The Technique: Two Pointers

The **Two Pointers** technique uses two references to iterate through a data structure, typically from different ends or at different speeds.

### When to Use Two Pointers:
- Searching pairs in a sorted array
- Finding a subarray with certain properties
- Optimizing brute force solutions that check all pairs

### Why It's Powerful:
- Reduces time complexity from O(n²) to O(n)
- Uses minimal extra memory O(1)

## 💡 How the Solution Works

```dart
int left = 0;                    // Start at the beginning
int right = height.length - 1;   // Start at the end
int maxArea = 0;                 // Track the best we've found

while (left < right) {
  // Calculate current area
  width = right - left;
  minHeight = min(height[left], height[right]);
  area = width × minHeight;
  
  // Update max if we found something better
  maxArea = max(maxArea, area);
  
  // Move the pointer at the shorter line
  if (height[left] < height[right]) {
    left++;   // Try to find a taller left line
  } else {
    right--;  // Try to find a taller right line
  }
}
```

### Step-by-Step Example

For `height = [1, 8, 6, 2, 5, 4, 8, 3, 7]`:

| Step | Left | Right | Width | Min Height | Area | Max So Far | Action |
|------|------|-------|-------|------------|------|------------|--------|
| 1 | 0 (1) | 8 (7) | 8 | 1 | 8 | 8 | Move left (1 < 7) |
| 2 | 1 (8) | 8 (7) | 7 | 7 | 49 | 49 | Move right (8 > 7) |
| 3 | 1 (8) | 7 (3) | 6 | 3 | 18 | 49 | Move right (8 > 3) |
| 4 | 1 (8) | 6 (8) | 5 | 8 | 40 | 49 | Move left (8 = 8) |
| ... | ... | ... | ... | ... | ... | ... | ... |

Final answer: **49**

## ⏱️ Complexity Analysis

### Time Complexity: **O(n)**
- We visit each element at most once
- The two pointers move towards each other, never backwards
- Each iteration does constant work: O(1)
- Total: O(n) where n is the length of the array

### Space Complexity: **O(1)**
- We only use a few variables: `left`, `right`, `maxArea`, `width`, `minHeight`, `area`
- No extra data structures that grow with input size
- Memory usage is constant regardless of input size

### Why This is Better Than Brute Force

**Brute Force Approach**: Check every pair of lines
- Time: O(n²) - for each line, check it with every other line
- Space: O(1)

**Our Two Pointer Approach**:
- Time: O(n) - visit each line once
- Space: O(1)

For an array of 1000 elements:
- Brute force: ~1,000,000 operations
- Two pointers: ~1,000 operations
- **1000x faster!** 🚀

## 🔑 Key Takeaways

1. **Two pointers** is great for optimizing pair-search problems
2. Moving the pointer at the **limiting factor** (shorter line) gives us the best chance of improvement
3. Sometimes a greedy approach (always move the shorter side) leads to the optimal solution
4. Linear time O(n) is much better than quadratic time O(n²) for large inputs

## 🎮 Try It Yourself

Think about why we can safely skip checking all pairs. When we move the pointer at the shorter line, are we missing any potential better solutions?

**Hint**: Consider what happens to the area if we move the pointer at the taller line instead!

