import 'dart:developer' as developer;

/// Solution for LeetCode Problem 16: 3Sum Closest
///
/// Given an integer array `nums` of length `n` and an integer `target`,
/// find three integers in `nums` such that the sum is closest to `target`.
/// Return the sum of the three integers.
class Solution {
  /// Finds three integers whose sum is closest to the target.
  ///
  /// Uses sorting combined with the two-pointer technique to efficiently
  /// find the closest sum without checking all possible triplets.
  ///
  /// Time Complexity: O(n²) where n is the length of the nums array
  /// Space Complexity: O(1) as we only use a constant amount of extra space
  ///
  /// [nums] - An array of integers
  /// [target] - The target sum to get closest to
  /// Returns the sum of three integers that is closest to the target
  int threeSumClosest(List<int> nums, int target) {
    // Sort the array to enable two-pointer technique
    nums.sort();

    // Initialize closest with the sum of first three elements
    int closest = nums[0] + nums[1] + nums[2];

    // Fix one element and use two pointers for the remaining two
    for (int i = 0; i < nums.length - 2; i++) {
      int left = i + 1;
      int right = nums.length - 1;

      while (left < right) {
        int tempSum = nums[i] + nums[left] + nums[right];

        // Update closest if current sum is closer to target
        if ((target - tempSum).abs() < (target - closest).abs()) {
          closest = tempSum;
        }

        // Adjust pointers based on comparison with target
        if (tempSum < target) {
          // Need larger sum, move left pointer right
          left++;
        } else if (tempSum > target) {
          // Need smaller sum, move right pointer left
          right--;
        } else {
          // Exact match found, return immediately
          return target;
        }
      }
    }

    return closest;
  }
}

void main() {
  final solution = Solution();

  // Test Case 1: Basic example
  List<int> nums1 = [-1, 2, 1, -4];
  int target1 = 1;
  int result1 = solution.threeSumClosest(nums1, target1);
  developer.log('Test 1: nums = $nums1, target = $target1');
  developer.log('Result: $result1');
  print('Test 1: Result = $result1 (Expected: 2)\n');

  // Test Case 2: Exact match
  List<int> nums2 = [0, 0, 0];
  int target2 = 1;
  int result2 = solution.threeSumClosest(nums2, target2);
  developer.log('Test 2: nums = $nums2, target = $target2');
  developer.log('Result: $result2');
  print('Test 2: Result = $result2 (Expected: 0)\n');

  // Test Case 3: Negative target
  List<int> nums3 = [1, 1, 1, 0];
  int target3 = -100;
  int result3 = solution.threeSumClosest(nums3, target3);
  developer.log('Test 3: nums = $nums3, target = $target3');
  developer.log('Result: $result3');
  print('Test 3: Result = $result3 (Expected: 2)\n');

  // Test Case 4: Large numbers
  List<int> nums4 = [1, 2, 4, 8, 16, 32, 64, 128];
  int target4 = 82;
  int result4 = solution.threeSumClosest(nums4, target4);
  developer.log('Test 4: nums = $nums4, target = $target4');
  developer.log('Result: $result4');
  print('Test 4: Result = $result4 (Expected: 82)\n');

  // Test Case 5: All negative
  List<int> nums5 = [-1, -2, -3, -4];
  int target5 = -5;
  int result5 = solution.threeSumClosest(nums5, target5);
  developer.log('Test 5: nums = $nums5, target = $target5');
  developer.log('Result: $result5');
  print('Test 5: Result = $result5 (Expected: -6)\n');

  // Test Case 6: Mixed positive and negative
  List<int> nums6 = [4, 0, 5, -5, 3, 3, 0, -4, -5];
  int target6 = -2;
  int result6 = solution.threeSumClosest(nums6, target6);
  developer.log('Test 6: nums = $nums6, target = $target6');
  developer.log('Result: $result6');
  print('Test 6: Result = $result6 (Expected: -2)\n');
}

