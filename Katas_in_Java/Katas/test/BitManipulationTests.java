import static org.junit.Assert.*;
import katas.BitManipulation;

import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;


public class BitManipulationTests {

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void test() {
		fail("Not yet implemented");
	}

	@Test
	public void testFindBinaryRepresentationOfANumberInPalindrome(){
	//Find if a binary representation of a number is palindrome. The function should work 
	//irrespective of number of bytes for an integer. Suppose if our machine is 4 bytes for
	//an int, how will you use the program for 8 byte machine. 
	}
	
	@Test
	public void testSwapBitsOfInteger(){
		//swap every two bits in an unsigned char .. eg swap bits at 0 and 1st position,
		//swap 2nd and 3rd position, swap 4th and 5th position etc ..
		
		int a = 8;
		int b = BitManipulation.swapBits(a);
	}
}
