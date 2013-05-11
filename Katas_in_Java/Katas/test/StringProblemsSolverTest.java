import static org.junit.Assert.*;

import java.util.HashMap;

import junit.framework.Assert;

import katas.StringProblemsSolver;

import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

public class StringProblemsSolverTest {

	@Before
	public void setUp() throws Exception {

	}

	@Test
	public void testFindLongestSubSequenceWithUniqueChars_case1() {
		// Given a string, find the longest sub sequence which contains only
		// unique characters.

		String input = "qwertyqwer";

		String longestSubSeq = StringProblemsSolver
				.findLongestSubSequenceWithUniqueChars(input);
		assertEquals("qwerty", longestSubSeq);
	}

	@Test
	public void testFindLongestSubSequenceWithUniqueChars_case2() {
		// Given a string, find the longest sub sequence which contains only
		// unique characters.

		String input = "asdfgasdfgqwert";

		String longestSubSeq = StringProblemsSolver
				.findLongestSubSequenceWithUniqueChars(input);
		assertEquals("asdfgqwert", longestSubSeq);
	}

	@Test
	public void testFindLongestSubStringWithUniqueChars_case1() {
		String input = "asdfgasdfgqwert";

		String longestSubSeq = StringProblemsSolver
				.findLongestSubStringWithUniqueChars(input);
		assertEquals("asdfgqwert", longestSubSeq);
	}

	@Test
	public void testFindLongestSubStringWithUniqueChars_case2() {
		String input = "asdfgqwert";

		String longestSubSeq = StringProblemsSolver
				.findLongestSubStringWithUniqueChars(input);
		assertEquals("asdfgqwert", longestSubSeq);
	}

	@Test
	public void testPrintZigZag() {
		// 0
		// The string "PAYPALISHIRING" is written in a zigzag pattern on a given
		// number of rows like this: (you may want to display this pattern in a
		// fixed font for better legibility)
		//
		// P   A   H   N
		// A P L S I I G
		// Y   I   R
		// And then read line by line: "PAHNAPLSIIGYIR"
		// Write the code that will take a string and make this conversion given
		// a number of rows:
		//
		// string convert(string text, int nRows);
		// convert("PAYPALISHIRING", 3) should return "PAHNAPLSIIGYIR".

		String input = "PAYPALISHIRING";
		// Create a matrix
		// travereseDown -- till number of rows or string ends -- call
		// traverseSlope
		// traverseSlope -- till number of rows or string ends -- ca;;
		// traverseDown
		//

		int rowCount = 3;
		char[] inputChars = input.toCharArray();
		
		char[][] = StringProblemsSolver.getInZigZagFormat(rowCount, inputChars);

	}


}
