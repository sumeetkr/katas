package katas;

public class PalindromePartitioning {

	// Given a string s, partition s such that every substring of the partition
	// is a palindrome.
	// Return the minimum cuts needed for a palindrome partitioning of s.
	// For example, given s = "aab",
	// Return 1 since the palindrome partitioning ["aa","b"] could be produced
	// using 1 cut.

	public static int getMinimumNumberOfCutsNeededToMakeEverySubstringAPalindrome(
			String input) {
		int count = 0;

		
		return count;

	}

	public static boolean isPalindrome(String stringToTest) {
		boolean isPalidrome = true;
		int length = stringToTest.length();

		for (int index = 0; index < length / 2; index++) {
			if (stringToTest.charAt(index) != stringToTest.charAt(length
					- index - 1)) {
				isPalidrome = false;
				break;
			}
		}

		return isPalidrome;
	}
}
