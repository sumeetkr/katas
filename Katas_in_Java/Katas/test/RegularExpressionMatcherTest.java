import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;


public class RegularExpressionMatcherTest {
//	‘.’ Matches any single character.
//	‘*’ Matches zero or more of the preceding element.
//	The matching should cover the entire input string (not partial).
//
//	The function prototype should be:
//	bool isMatch(const char *s, const char *p)
//
//	Some examples:
//	isMatch(“aa”,”a”)  false
//	isMatch(“aa”,”aa”) true
//	isMatch(“aaa”,”aa”)  false
//	isMatch(“aa”, “a*”)  true
//	isMatch(“aa”, “.*”)  true
//	isMatch(“ab”, “.*”)  true
//	isMatch(“aab”, “c*a*b”)  true
	
	@Test
	public void testIsMatchWithDots() {
		String input = "aabbacaa";
		String match = "aa.b.ca*";
		
		assertTrue(isMatch(input, match));
				
	}
	
	private boolean isMatch(String input, String match) {
	boolean matched = true;
	
	char[] inputArray = input.toCharArray();
	char [] matchArray = match.toCharArray();
    char lastChar= inputArray[0];
   
    
	for (int i = 0; i < inputArray.length; i++) {
		
		char current = matchArray[i];
	    switch(current) {
	    case '.':
	    		lastChar = inputArray[i];
	    		break;
	    		
	    case '*':
	    	if(inputArray[i] != lastChar) {
	    		matched = false;
	    	}
	    	break;
	    default:
	    	if(inputArray[i] != matchArray[i]) {
	    		matched = false;
	    	}else
	    	{
	    		lastChar = matchArray[i];
	    	}
	    	break;
	    }
	    
		if(!matched) {
			break;
		}
	}
	
	return matched;	
	}
	
	@Test
	public void testIsMatchWithStar() {
		
	}

	@Test
	public void test() {
		fail("Not yet implemented");
	}

}
