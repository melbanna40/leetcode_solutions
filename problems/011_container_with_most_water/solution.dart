import 'dart:developer' as developer;

/// Solution for LeetCode Problem 11: Container With Most Water
///
/// Given n non-negative integers a1, a2, ..., an, where each represents
/// a point at coordinate (i, ai). n vertical lines are drawn such that
/// the two endpoints of the line i is at (i, ai) and (i, 0).
/// Find two lines, which, together with the x-axis forms a container,
/// such that the container contains the most water.
class Solution {
  /// Finds the maximum area of water that can be contained between two lines.
  ///
  /// Uses the two-pointer technique to efficiently find the optimal container.
  ///
  /// Time Complexity: O(n) where n is the length of the height array
  /// Space Complexity: O(1) as we only use a constant amount of extra space
  int maxArea(List<int> height) {
    int left = 0, right = height.length - 1, maxArea = 0;

    while (left < right) {
      int width = right - left;
      int minHeight = height[left] < height[right] ? height[left] : height[right];
      int area = width * minHeight;

      if (area > maxArea) maxArea = area;

      if (height[left] < height[right]) {
        left++;
      } else {
        right--;
      }
    }

    return maxArea;
  }
}

void main() {
  final solution = Solution();

  // Test Case 1
  List<int> height1 = [1, 8, 6, 2, 5, 4, 8, 3, 7];
  int result1 = solution.maxArea(height1);
  developer.log('Test 1: height = $height1');
  developer.log('Maximum area: $result1'); // Expected: 49
  print('Test 1: Maximum area = $result1 (Expected: 49)\n');

  // Test Case 2
  List<int> height2 = [1, 1];
  int result2 = solution.maxArea(height2);
  developer.log('Test 2: height = $height2');
  developer.log('Maximum area: $result2'); // Expected: 1
  print('Test 2: Maximum area = $result2 (Expected: 1)\n');

  // Test Case 3
  List<int> height3 = [4, 3, 2, 1, 4];
  int result3 = solution.maxArea(height3);
  developer.log('Test 3: height = $height3');
  developer.log('Maximum area: $result3'); // Expected: 16
  print('Test 3: Maximum area = $result3 (Expected: 16)\n');

  // Test Case 4
  List<int> height4 = [1, 2, 1];
  int result4 = solution.maxArea(height4);
  developer.log('Test 4: height = $height4');
  developer.log('Maximum area: $result4'); // Expected: 2
  print('Test 4: Maximum area = $result4 (Expected: 2)\n');
}
