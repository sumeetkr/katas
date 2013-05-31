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
	
	public static boolean isIntegerAPalindrome(int input) {
		int inputCopy = input;
		int reverse=0;
		while(input > 0) {
			reverse = reverse*10 + input % 10;
			input = (input - input % 10)/10;
		}
		
		return inputCopy == reverse;
	}
	
	public static boolean isIntegerAPalindrome2(int input) {
		boolean isPalindrome = true;
		
		int div =1;
		while(div*10 < input) {
			div *= 10;
		}
		
		while(input > 0) {
			int maxDig = input/div;
			int minDig = input % 10;
			
			if(maxDig != minDig) {
				isPalindrome = false;
				break;
			}
			
			input = (input %div)/10;
			div = div/100;
		}
		
		return isPalindrome;
		
	}

}
