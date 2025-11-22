# 125. Valid Palindrome

## 📖 Problem Description

A phrase is a **palindrome** if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.

Given a string `s`, return `true` if it is a palindrome, or `false` otherwise.

**Example 1:**
```
Input: s = "A man, a plan, a canal: Panama"
Output: true
Explanation: "amanaplanacanalpanama" is a palindrome.
```

**Example 2:**
```
Input: s = "race a car"
Output: false
Explanation: "raceacar" is not a palindrome.
```

**Example 3:**
```
Input: s = " "
Output: true
Explanation: s is an empty string "" after removing non-alphanumeric characters.
Since an empty string reads the same forward and backward, it is a palindrome.
```

**Constraints:**
- `1 <= s.length <= 2 * 10^5`
- `s` consists only of printable ASCII characters

## 🎯 The Intuition (Explained Simply)

A palindrome reads the same forward and backward. To check if a string is a palindrome:

1. **Clean the string**: Remove all non-alphanumeric characters and convert to lowercase
2. **Compare from both ends**: Use two pointers starting at the beginning and end
3. **Move towards center**: If characters match, move both pointers inward; if they don't match, it's not a palindrome

### Why Two Pointers Work Here

- **Symmetry**: Palindromes are symmetric—the first character should match the last, second should match second-to-last, etc.
- **Efficient**: We only need to check half the string (once pointers meet, we're done)
- **Early exit**: If we find a mismatch, we can return false immediately

## 🧠 The Technique: Two Pointers

The **Two Pointers** technique uses two references moving from opposite ends towards the center to check symmetry.

### When to Use Two Pointers for Palindromes:
- ✅ Checking if a string/array is symmetric
- ✅ Comparing elements from opposite ends
- ✅ Problems requiring bidirectional traversal
- ✅ Validating palindromic properties

### Why It's Powerful:
- Reduces time complexity from O(n²) to O(n)
- Only needs to check half the string
- Simple and intuitive logic

## 💡 How the Solution Works

```dart
// Step 1: Clean the string
String cleanedString = s.replaceAll(RegExp(r'[^A-Za-z0-9]'), '').toLowerCase();

// Step 2: Set up two pointers
int left = 0;
int right = cleanedString.length - 1;

// Step 3: Compare while moving towards center
while (left < right) {
  if (cleanedString[left] != cleanedString[right]) {
    return false;  // Mismatch found
  }
  left++;   // Move left pointer right
  right--;   // Move right pointer left
}

return true;  // All characters matched
```

### Step-by-Step Example

For `s = "A man, a plan, a canal: Panama"`:

**Step 1: Clean the string**
- Remove non-alphanumeric: `"A man, a plan, a canal: Panama"` → `"AmanaplanacanalPanama"`
- Convert to lowercase: `"amanaplanacanalpanama"`

**Step 2: Two-pointer comparison**

| Step | Left | Right | cleanedString[left] | cleanedString[right] | Match? | Action |
|------|------|-------|---------------------|----------------------|--------|--------|
| 1 | 0 | 20 | 'a' | 'a' | ✅ | left++, right-- |
| 2 | 1 | 19 | 'm' | 'm' | ✅ | left++, right-- |
| 3 | 2 | 18 | 'a' | 'a' | ✅ | left++, right-- |
| ... | ... | ... | ... | ... | ✅ | ... |
| 10 | 9 | 11 | 'c' | 'c' | ✅ | left++, right-- |
| 11 | 10 | 10 | 'a' | 'a' | ✅ | left >= right, done |

Final answer: **true** (all characters matched)

## ⏱️ Complexity Analysis

### Time Complexity: **O(n)**
- **Cleaning step**: O(n) - iterate through string to remove non-alphanumeric characters
- **Two-pointer comparison**: O(n) - in worst case, check all characters
- **Total**: O(n) where n is the length of the input string

### Space Complexity: **O(n)**
- **Cleaned string**: O(n) - we create a new string with cleaned characters
- **Pointers**: O(1) - only use a few variables
- **Total**: O(n) for the cleaned string

### Space Optimization Note

We could optimize to **O(1) space** by checking characters in-place without creating a cleaned string:
- Use helper function to check if character is alphanumeric
- Skip non-alphanumeric characters during pointer movement
- This would require more complex logic but saves space

### Comparison with Alternatives

| Approach | Time | Space | Best For |
|----------|------|-------|----------|
| **Two Pointers (Current)** ⭐ | O(n) | O(n) | **Readable and maintainable** ✓ |
| Two Pointers (Optimized) | O(n) | O(1) | Memory-constrained environments |
| Reverse & Compare | O(n) | O(n) | Simpler logic, less efficient |

## 🔑 Key Insights

1. **Cleaning is crucial**: Must remove non-alphanumeric characters and normalize case
2. **Edge cases matter**: Empty string and single character are palindromes
3. **Early exit optimization**: Return false immediately on first mismatch
4. **Symmetry check**: Only need to check until pointers meet in the middle

## 🎯 Edge Cases to Consider

1. **Empty string**: `" "` → `""` → true (empty string is palindrome)
2. **Single character**: `"a"` → true
3. **Only non-alphanumeric**: `", . : !"` → `""` → true
4. **Mixed case**: `"Aba"` → `"aba"` → true
5. **With numbers**: `"A1b2B2b1a"` → `"a1b2b2b1a"` → true
6. **Not palindrome**: `"race a car"` → `"raceacar"` → false (e != a)

## 🔍 Regex Pattern Explanation

```dart
RegExp(r'[^A-Za-z0-9]')
```

- `[^...]` - Negation: match anything NOT in the brackets
- `A-Z` - Uppercase letters A through Z
- `a-z` - Lowercase letters a through z
- `0-9` - Digits 0 through 9
- **Result**: Matches any character that is NOT alphanumeric

## 🔑 Key Takeaways

1. **Two pointers** is perfect for checking symmetry/palindromes
2. **String preprocessing** (cleaning) simplifies the comparison logic
3. **Early exit** improves average-case performance
4. **Case sensitivity** matters—always normalize to lowercase
5. **Edge cases** like empty strings need special handling
6. Trade-off between readability (O(n) space) and optimization (O(1) space)

## 🎮 Try It Yourself

Think about how you could optimize the space complexity to O(1). What would you need to change?

**Hint**: Instead of creating a cleaned string, check characters in-place and skip non-alphanumeric ones during pointer movement.

## 📚 Related Problems

- [680. Valid Palindrome II](https://leetcode.com/problems/valid-palindrome-ii/) - Can delete at most one character
- [234. Palindrome Linked List](https://leetcode.com/problems/palindrome-linked-list/) - Check if linked list is palindrome
- [9. Palindrome Number](https://leetcode.com/problems/palindrome-number/) - Check if integer is palindrome
- [5. Longest Palindromic Substring](https://leetcode.com/problems/longest-palindromic-substring/) - Find longest palindrome substring

## 🔄 Pattern Recognition

This problem demonstrates the **two-pointer symmetry check** pattern:
1. Start with pointers at both ends
2. Compare elements while moving towards center
3. Return false on first mismatch, true if all match

This pattern appears in:
- Palindrome validation (this problem)
- Palindrome construction
- Symmetric array/string problems
- Reverse string problems

