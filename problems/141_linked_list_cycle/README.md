# 141. Linked List Cycle

## 📖 Problem Description

Given `head`, the head of a linked list, determine if the linked list has a cycle in it.

There is a **cycle** in a linked list if there is some node in the list that can be reached again by continuously following the `next` pointer. Internally, `pos` is used to denote the index of the node that tail's `next` pointer is connected to. Note that `pos` is **not passed** as a parameter.

Return `true` if there is a cycle in the linked list. Otherwise, return `false`.

**Example 1:**
```
Input: head = [3,2,0,-4], pos = 1
Output: true
Explanation: There is a cycle in the linked list, where the tail connects to the 1st node (0-indexed).
```

**Example 2:**
```
Input: head = [1,2], pos = 0
Output: true
Explanation: There is a cycle in the linked list, where the tail connects to the 0th node.
```

**Example 3:**
```
Input: head = [1], pos = -1
Output: false
Explanation: There is no cycle in the linked list.
```

**Constraints:**
- The number of the nodes in the list is in the range `[0, 10^4]`
- `-10^5 <= Node.val <= 10^5`
- `pos` is `-1` or a **valid index** in the linked-list

## 🎯 The Intuition (Explained Simply)

Imagine two runners on a circular track:
- **Tortoise (slow)**: Moves one step at a time
- **Hare (fast)**: Moves two steps at a time

If the track is circular (has a cycle), the fast runner will eventually "lap" the slow runner and they'll meet. If the track is straight (no cycle), the fast runner will reach the end first.

### Why This Works

**Mathematical Proof:**
- If there's a cycle of length `C` and the slow pointer is `k` steps into the cycle when fast enters:
  - After `t` steps: slow is at position `(k + t) mod C`
  - After `t` steps: fast is at position `(k + 2t) mod C`
  - They meet when: `(k + t) mod C = (k + 2t) mod C`
  - This simplifies to: `t mod C = 0`, which will always happen

**Key Insight:** The fast pointer will catch up to the slow pointer within one cycle length, making this O(n) time.

## 🧠 The Technique: Fast & Slow Pointers (Floyd's Cycle Detection)

Also known as the **"Tortoise and Hare"** algorithm, this is a classic two-pointer technique for cycle detection.

### When to Use Fast & Slow Pointers:
- ✅ Detecting cycles in linked lists
- ✅ Finding the middle of a linked list
- ✅ Finding the kth node from the end
- ✅ Problems involving linked list traversal with constraints

### Why It's Powerful:
- **O(1) space**: Only uses two pointers, no extra data structures
- **O(n) time**: Linear time complexity
- **No modification**: Doesn't modify the original list
- **Elegant**: Simple and intuitive algorithm

## 💡 How the Solution Works

```dart
// 1. Initialize both pointers at the head
ListNode? slow = head;
ListNode? fast = head;

// 2. Move pointers at different speeds
while (fast != null && fast.next != null) {
  slow = slow.next;        // Move 1 step
  fast = fast.next.next;  // Move 2 steps
  
  // 3. Check if they meet
  if (slow == fast) {
    return true;  // Cycle detected!
  }
}

return false;  // No cycle found
```

### Step-by-Step Example

For a list with cycle: `3 -> 2 -> 0 -> -4 -> (back to 2)`

| Step | Slow Position | Fast Position | Action |
|------|---------------|---------------|--------|
| 0 | 3 | 3 | Start |
| 1 | 2 | 0 | slow++, fast += 2 |
| 2 | 0 | 2 | slow++, fast += 2 |
| 3 | -4 | -4 | slow++, fast += 2 |
| 4 | 2 | 0 | slow++, fast += 2 |
| 5 | 0 | 2 | slow++, fast += 2 |
| 6 | -4 | -4 | **They meet!** → Return true |

## ⏱️ Complexity Analysis

### Time Complexity: **O(n)**
- **Best case**: O(1) - Empty list or single node
- **Worst case**: O(n) - Cycle detected after traversing the list
- **No cycle**: O(n) - Fast pointer reaches end after n/2 steps
- **With cycle**: O(n) - Fast and slow meet within one cycle length

### Space Complexity: **O(1)**
- Only uses two pointers: `slow` and `fast`
- No additional data structures
- Constant space regardless of list size

### Comparison with Alternatives

| Approach | Time | Space | Best For |
|----------|------|-------|----------|
| **Fast & Slow Pointers** ⭐ | O(n) | O(1) | **This problem** ✓ |
| Hash Set | O(n) | O(n) | When you need to track visited nodes |
| Marking Nodes | O(n) | O(1) | When you can modify the list |

### Why Fast & Slow Pointers is Optimal

**Hash Set Approach:**
- Time: O(n) - visit each node once
- Space: O(n) - store all visited nodes
- **Problem**: Requires extra memory

**Fast & Slow Pointers:**
- Time: O(n) - same time complexity
- Space: O(1) - only two pointers
- **Advantage**: No extra memory needed!

## 🔑 Key Insights

1. **Two speeds**: Fast pointer moves twice as fast as slow pointer
2. **Inevitable meeting**: If there's a cycle, they will meet (mathematically guaranteed)
3. **Null check**: Must check `fast != null && fast.next != null` before accessing `fast.next.next`
4. **Reference equality**: Use `==` to check if pointers point to the same node object
5. **Edge cases**: Empty list and single node can't have cycles

## 🎯 Edge Cases to Consider

1. **Empty list**: `null` → false (no cycle possible)
2. **Single node**: `[1]` → false (no cycle, next is null)
3. **Two nodes with cycle**: `1 -> 2 -> 1` → true
4. **Two nodes without cycle**: `1 -> 2 -> null` → false
5. **Long list with cycle**: Cycle can be anywhere in the list
6. **Self-loop**: Node points to itself → true

## 🔍 Why Check `fast.next != null`?

```dart
while (fast != null && fast.next != null) {
  fast = fast.next.next;  // Safe because we checked fast.next != null
}
```

- We need to access `fast.next.next`
- If `fast.next` is null, `fast.next.next` would cause a null reference error
- Checking both `fast != null` and `fast.next != null` ensures safety

## 🔑 Key Takeaways

1. **Floyd's Cycle Detection** is the optimal solution for cycle detection
2. **Fast & Slow Pointers** pattern is powerful for linked list problems
3. **O(1) space** is achievable without hash sets
4. **Mathematical guarantee**: If there's a cycle, pointers will meet
5. **Null safety**: Always check for null before accessing next pointers
6. **Reference equality**: `==` checks if two pointers reference the same object

## 🎮 Try It Yourself

Think about what happens if we move the fast pointer 3 steps instead of 2. Would the algorithm still work?

**Hint**: The algorithm works as long as fast moves faster than slow, but moving 2 steps is optimal for cycle detection.

## 📚 Related Problems

- [142. Linked List Cycle II](https://leetcode.com/problems/linked-list-cycle-ii/) - Find where the cycle begins
- [876. Middle of the Linked List](https://leetcode.com/problems/middle-of-the-linked-list/) - Find the middle node
- [202. Happy Number](https://leetcode.com/problems/happy-number/) - Uses cycle detection concept
- [287. Find the Duplicate Number](https://leetcode.com/problems/find-the-duplicate-number/) - Cycle detection in arrays

## 🔄 Pattern Recognition

This problem demonstrates the **Fast & Slow Pointers** pattern:
1. Initialize both pointers at the start
2. Move them at different speeds
3. Check for meeting point (cycle) or end of list (no cycle)

This pattern appears in:
- Cycle detection (this problem)
- Finding middle element
- Finding kth element from end
- Palindrome checking in linked lists

## 🧪 Mathematical Proof (Optional)

**Why do they meet if there's a cycle?**

Let:
- `L` = distance from head to cycle start
- `C` = cycle length
- `k` = distance from cycle start where slow enters cycle
- `m` = number of steps after slow enters cycle

When slow enters cycle:
- Slow position in cycle: `k`
- Fast position in cycle: `(k + 2L) mod C` (fast has moved 2L steps)

After `m` more steps:
- Slow: `(k + m) mod C`
- Fast: `(k + 2L + 2m) mod C`

They meet when: `(k + m) mod C = (k + 2L + 2m) mod C`
Simplifying: `m mod C = (2L) mod C`

Since `L` and `C` are fixed, there exists an `m` where they meet, and `m < C`, so they meet within one cycle!

