import org.junit.Test;

import junit.framework.Assert;
import junit.framework.TestCase;
import katas.PalindromePartitioning;


public class PalindromePartitioningTest extends TestCase {
	//Given a string s, partition s such that every substring of the partition is a palindrome.
	//Return the minimum cuts needed for a palindrome partitioning of s.
	//For example, given s = "aab",
	//Return 1 since the palindrome partitioning ["aa","b"] could be produced using 1 cut.
	
	protected static void setUpBeforeClass() throws Exception {
	}

	protected void setUp() throws Exception {
		super.setUp();
	}
	
	@Test
	public void testIsPalindromeCase1(){
		String input= "aab";
		boolean isPalinDrome = PalindromePartitioning.isPalindrome(input);
		assertEquals(false, isPalinDrome);
	}
	
	@Test
	public void testIsPalindromeCase2(){
		String input= "ab";
		boolean isPalinDrome = PalindromePartitioning.isPalindrome(input);
		assertEquals(false, isPalinDrome);
	}
	
	@Test
	public void testIsPalindromeCase3(){
		String input= "abba";
		boolean isPalinDrome = PalindromePartitioning.isPalindrome(input);
		assertEquals(true, isPalinDrome);
	}
	
	@Test
	public void testIsPalindromeCase4(){
		String input= "abcba";
		boolean isPalinDrome = PalindromePartitioning.isPalindrome(input);
		assertEquals(true, isPalinDrome);
	}
	
	@Test
	public void testGetMinimumNumberOfCutsNeededToMakeEverySubstringAPalindromeCase1(){
	
		String input= "aab";
		int partitionsNeded = PalindromePartitioning.getMinimumNumberOfCutsNeededToMakeEverySubstringAPalindrome(input);
		assertEquals(1, partitionsNeded);
		
	}
	
	@Test
	public void testGetMinimumNumberOfCutsNeededToMakeEverySubstringAPalindromeCase2(){
	
		String input= "aabc";
		int partitionsNeded = PalindromePartitioning.getMinimumNumberOfCutsNeededToMakeEverySubstringAPalindrome(input);
		assertEquals(2, partitionsNeded);
	}
	
	@Test
	public void testGetMinimumNumberOfCutsNeededToMakeEverySubstringAPalindromeCase3(){
	
		String input= "aabbb";
		int partitionsNeded = PalindromePartitioning.getMinimumNumberOfCutsNeededToMakeEverySubstringAPalindrome(input);
		assertEquals(2, partitionsNeded);
		
	}
	
	//Given a string s, partition s such that every substring of the partition is a palindrome.
	//Return all possible palindrome partitioning of s.
	//For example, given s = "aab",
	//Return
	  //[
	    //["aa","b"],
	    //["a","a","b"]
	  //]
	
}
