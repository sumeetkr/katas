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
	//Given a string, find the longest sub sequence which contains only unique characters.
		
		String input = "qwertyqwer";
		
		String longestSubSeq = StringProblemsSolver.findLongestSubSequenceWithUniqueChars(input);
		assertEquals("qwerty", longestSubSeq);
	}

	@Test
	public void testFindLongestSubSequenceWithUniqueChars_case2() {
	//Given a string, find the longest sub sequence which contains only unique characters.
		
		String input = "asdfgasdfgqwert";
		
		String longestSubSeq = StringProblemsSolver.findLongestSubSequenceWithUniqueChars(input);
		assertEquals("asdfgqwert", longestSubSeq);
	}
}
