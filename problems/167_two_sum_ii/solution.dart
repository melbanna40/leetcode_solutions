import 'dart:developer' as developer;

/// Solution for LeetCode Problem 167: Two Sum II - Input Array Is Sorted
///
/// Given a 1-indexed array of integers that is already sorted in non-decreasing
/// order, find two numbers such that they add up to a specific target number.
/// Return the indices of the two numbers (1-indexed) as an integer array.
class Solution {
  /// Finds two numbers in the sorted array that sum to the target.
  ///
  /// Uses the two-pointer technique to efficiently find the pair by exploiting
  /// the sorted property of the array.
  ///
  /// Time Complexity: O(n) where n is the length of the numbers array
  /// Space Complexity: O(1) as we only use a constant amount of extra space
  ///
  /// [numbers] - A sorted array of integers (non-decreasing order)
  /// [target] - The target sum to find
  /// Returns a list containing the 1-indexed positions of the two numbers
  List<int> twoSum(List<int> numbers, int target) {
    int left = 0;
    int right = numbers.length - 1;

    while (left < right) {
      int sum = numbers[left] + numbers[right];

      if (sum == target) {
        // Found the pair! Return 1-indexed positions
        return [left + 1, right + 1];
      } else if (sum < target) {
        // Need a larger sum, move left pointer right
        left++;
      } else {
        // Need a smaller sum, move right pointer left
        right--;
      }
    }

    // According to problem constraints, exactly one solution exists
    // This return should never be reached, but included for completeness
    return [];
  }
}

void main() {
  final solution = Solution();

  // Test Case 1: Basic example
  List<int> numbers1 = [2, 7, 11, 15];
  int target1 = 9;
  List<int> result1 = solution.twoSum(numbers1, target1);
  developer.log('Test 1: numbers = $numbers1, target = $target1');
  developer.log('Result: $result1');
  print('Test 1: Result = $result1 (Expected: [1, 2])\n');

  // Test Case 2: Exact two elements
  List<int> numbers2 = [1, 2];
  int target2 = 3;
  List<int> result2 = solution.twoSum(numbers2, target2);
  developer.log('Test 2: numbers = $numbers2, target = $target2');
  developer.log('Result: $result2');
  print('Test 2: Result = $result2 (Expected: [1, 2])\n');

  // Test Case 3: Duplicates
  List<int> numbers3 = [1, 2, 2, 3];
  int target3 = 4;
  List<int> result3 = solution.twoSum(numbers3, target3);
  developer.log('Test 3: numbers = $numbers3, target = $target3');
  developer.log('Result: $result3');
  print('Test 3: Result = $result3 (Expected: [1, 4] or [2, 3])\n');

  // Test Case 4: Negative numbers
  List<int> numbers4 = [-1, 0, 1];
  int target4 = 0;
  List<int> result4 = solution.twoSum(numbers4, target4);
  developer.log('Test 4: numbers = $numbers4, target = $target4');
  developer.log('Result: $result4');
  print('Test 4: Result = $result4 (Expected: [1, 3])\n');

  // Test Case 5: Large gaps
  List<int> numbers5 = [1, 1000];
  int target5 = 1001;
  List<int> result5 = solution.twoSum(numbers5, target5);
  developer.log('Test 5: numbers = $numbers5, target = $target5');
  developer.log('Result: $result5');
  print('Test 5: Result = $result5 (Expected: [1, 2])\n');

  // Test Case 6: More complex example
  List<int> numbers6 = [2, 3, 4];
  int target6 = 6;
  List<int> result6 = solution.twoSum(numbers6, target6);
  developer.log('Test 6: numbers = $numbers6, target = $target6');
  developer.log('Result: $result6');
  print('Test 6: Result = $result6 (Expected: [1, 3])\n');
}
