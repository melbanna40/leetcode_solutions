import 'dart:developer' as developer;

/// Solution for LeetCode Problem 125: Valid Palindrome
///
/// A phrase is a palindrome if, after converting all uppercase letters into
/// lowercase letters and removing all non-alphanumeric characters, it reads
/// the same forward and backward. Alphanumeric characters include letters
/// and numbers.
class Solution {
  /// Determines if a string is a palindrome after cleaning.
  ///
  /// Uses the two-pointer technique to efficiently check if the cleaned string
  /// reads the same forward and backward.
  ///
  /// Time Complexity: O(n) where n is the length of the string
  /// Space Complexity: O(n) for the cleaned string (could be optimized to O(1))
  ///
  /// [s] - The input string to check
  /// Returns true if the string is a palindrome, false otherwise
  bool isPalindrome(String s) {
    // Step 1: Create a new, clean string.
    // This removes all non-alphanumeric characters and converts the string to lowercase.
    String cleanedString = s.replaceAll(RegExp(r'[^A-Za-z0-9]'), '').toLowerCase();

    // Edge case: If the cleaned string is empty or has only one character,
    // it's considered a palindrome.
    if (cleanedString.length <= 1) {
      return true;
    }

    // Step 2: Set up the two pointers for the clean string.
    int left = 0;
    int right = cleanedString.length - 1;

    // Step 3: Compare characters while moving towards the center.
    while (left < right) {
      // Directly compare the characters.
      // No need to check if they are valid or convert to lowercase because
      // the string is already cleaned.
      if (cleanedString[left] != cleanedString[right]) {
        // If we find a mismatch, we can stop immediately. It's not a palindrome.
        return false;
      }

      // If the characters match, move the pointers closer to the middle.
      left++;
      right--;
    }

    // If the loop finishes without finding any mismatches, the string is a palindrome.
    return true;
  }
}

void main() {
  final solution = Solution();

  // Test Case 1: Basic example
  String test1 = "A man, a plan, a canal: Panama";
  bool result1 = solution.isPalindrome(test1);
  developer.log('Test 1: "$test1"');
  developer.log('Result: $result1');
  print('Test 1: Is "$test1" a palindrome? $result1 (Expected: true)\n');

  // Test Case 2: Not a palindrome
  String test2 = "race a car";
  bool result2 = solution.isPalindrome(test2);
  developer.log('Test 2: "$test2"');
  developer.log('Result: $result2');
  print('Test 2: Is "$test2" a palindrome? $result2 (Expected: false)\n');

  // Test Case 3: Another valid palindrome
  String test3 = "Was it a car or a cat I saw?";
  bool result3 = solution.isPalindrome(test3);
  developer.log('Test 3: "$test3"');
  developer.log('Result: $result3');
  print('Test 3: Is "$test3" a palindrome? $result3 (Expected: true)\n');

  // Test Case 4: Empty string
  String test4 = " ";
  bool result4 = solution.isPalindrome(test4);
  developer.log('Test 4: "$test4"');
  developer.log('Result: $result4');
  print('Test 4: Is "$test4" a palindrome? $result4 (Expected: true)\n');

  // Test Case 5: Single character
  String test5 = "a";
  bool result5 = solution.isPalindrome(test5);
  developer.log('Test 5: "$test5"');
  developer.log('Result: $result5');
  print('Test 5: Is "$test5" a palindrome? $result5 (Expected: true)\n');

  // Test Case 6: With numbers
  String test6 = "A1b2B2b1a";
  bool result6 = solution.isPalindrome(test6);
  developer.log('Test 6: "$test6"');
  developer.log('Result: $result6');
  print('Test 6: Is "$test6" a palindrome? $result6 (Expected: true)\n');

  // Test Case 7: Not a palindrome with numbers
  String test7 = "A1b2B3b1a";
  bool result7 = solution.isPalindrome(test7);
  developer.log('Test 7: "$test7"');
  developer.log('Result: $result7');
  print('Test 7: Is "$test7" a palindrome? $result7 (Expected: false)\n');
}

