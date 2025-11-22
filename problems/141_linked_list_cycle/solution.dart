import 'dart:developer' as developer;

/// Definition for singly-linked list.
class ListNode {
  int val;
  ListNode? next;

  ListNode([this.val = 0, this.next]);
}

/// Solution for LeetCode Problem 141: Linked List Cycle
///
/// Given head, the head of a linked list, determine if the linked list
/// has a cycle in it. There is a cycle in a linked list if there is some
/// node in the list that can be reached again by continuously following
/// the next pointer.
class Solution {
  /// Determines if the linked list has a cycle using Floyd's Cycle Detection Algorithm.
  ///
  /// Uses the "Tortoise and Hare" (fast and slow pointers) technique:
  /// - Slow pointer moves one step at a time
  /// - Fast pointer moves two steps at a time
  /// - If there's a cycle, they will eventually meet
  /// - If there's no cycle, fast will reach null first
  ///
  /// Time Complexity: O(n) where n is the number of nodes
  /// Space Complexity: O(1) as we only use two pointers
  ///
  /// [head] - The head of the linked list
  /// Returns true if the linked list has a cycle, false otherwise
  bool hasCycle(ListNode? head) {
    // If the list is empty or has only one node, it can't have a cycle.
    if (head == null || head.next == null) {
      return false;
    }

    // 1. Place the Tortoise (slow) and the Hare (fast) at the starting line.
    ListNode? slow = head;
    ListNode? fast = head;

    // 2. Let them run.
    // The loop continues as long as the fast runner hasn't fallen off the list.
    // We must check 'fast' and 'fast.next' to avoid a null reference exception
    // when we try to do 'fast.next.next'.
    while (fast != null && fast.next != null) {
      // The Tortoise moves one step.
      slow = slow?.next;

      // The Hare moves two steps.
      fast = fast.next?.next;

      // 3. Check if they have met.
      // We use '==' to check if they are the exact same object in memory.
      if (slow == fast) {
        // If they meet, we have found a cycle!
        return true;
      }
    }

    // 4. If the loop finishes, it means the fast runner reached the end (null).
    // Therefore, there is no cycle.
    return false;
  }
}

void main() {
  final solution = Solution();

  // Test Case 1: A list with a cycle
  ListNode node1 = ListNode(3);
  ListNode node2 = ListNode(2);
  ListNode node3 = ListNode(0);
  ListNode node4 = ListNode(-4);

  node1.next = node2;
  node2.next = node3;
  node3.next = node4;
  node4.next = node2; // <-- This creates the cycle! The list loops back to node2.

  bool result1 = solution.hasCycle(node1);
  developer.log('Test 1: List with cycle (3 -> 2 -> 0 -> -4 -> 2)');
  developer.log('Result: $result1');
  print('Test 1: Does the list have a cycle? $result1 (Expected: true)\n');

  // Test Case 2: A straight list with no cycle
  ListNode nodeA = ListNode(1);
  ListNode nodeB = ListNode(2);

  nodeA.next = nodeB; // List ends after nodeB (nodeB.next is null).

  bool result2 = solution.hasCycle(nodeA);
  developer.log('Test 2: List without cycle (1 -> 2 -> null)');
  developer.log('Result: $result2');
  print('Test 2: Does the list have a cycle? $result2 (Expected: false)\n');

  // Test Case 3: Single node (no cycle)
  ListNode nodeC = ListNode(1);

  bool result3 = solution.hasCycle(nodeC);
  developer.log('Test 3: Single node (1 -> null)');
  developer.log('Result: $result3');
  print('Test 3: Does the list have a cycle? $result3 (Expected: false)\n');

  // Test Case 4: Empty list
  bool result4 = solution.hasCycle(null);
  developer.log('Test 4: Empty list (null)');
  developer.log('Result: $result4');
  print('Test 4: Does the list have a cycle? $result4 (Expected: false)\n');

  // Test Case 5: Two nodes with cycle
  ListNode nodeD = ListNode(1);
  ListNode nodeE = ListNode(2);

  nodeD.next = nodeE;
  nodeE.next = nodeD; // Cycle: 1 -> 2 -> 1

  bool result5 = solution.hasCycle(nodeD);
  developer.log('Test 5: Two nodes with cycle (1 -> 2 -> 1)');
  developer.log('Result: $result5');
  print('Test 5: Does the list have a cycle? $result5 (Expected: true)\n');

  // Test Case 6: Longer list without cycle
  ListNode nodeF = ListNode(1);
  ListNode nodeG = ListNode(2);
  ListNode nodeH = ListNode(3);
  ListNode nodeI = ListNode(4);
  ListNode nodeJ = ListNode(5);

  nodeF.next = nodeG;
  nodeG.next = nodeH;
  nodeH.next = nodeI;
  nodeI.next = nodeJ; // 1 -> 2 -> 3 -> 4 -> 5 -> null

  bool result6 = solution.hasCycle(nodeF);
  developer.log('Test 6: Longer list without cycle (1 -> 2 -> 3 -> 4 -> 5 -> null)');
  developer.log('Result: $result6');
  print('Test 6: Does the list have a cycle? $result6 (Expected: false)\n');
}

