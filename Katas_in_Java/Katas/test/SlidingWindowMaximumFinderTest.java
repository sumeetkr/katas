import static org.junit.Assert.*;
import katas.SlidingWindowMaximumFinder;

import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import com.sun.tools.javac.code.Attribute.Array;

public class SlidingWindowMaximumFinderTest {

//	 A long array A[] is given to you. There is a sliding window of size w
//	 which is
//	 moving from the very left of the array to the very right. You can only
//	 see
//	 the w numbers in the window. Each time the sliding window moves
//	 rightwards
//	 by one position. Following is an example:
//	 The array is [1 3 -1 -3 5 3 6 7], and w is 3.
//	
//	 Window position Max
//	 --------------- -----
//	 [1 3 -1] -3 5 3 6 7 3
//	 1 [3 -1 -3] 5 3 6 7 3
//	 1 3 [-1 -3 5] 3 6 7 5
//	 1 3 -1 [-3 5 3] 6 7 5
//	 1 3 -1 -3 [5 3 6] 7 6
//	 1 3 -1 -3 5 [3 6 7] 7
//	 Input: A long array A[], and a window width w
//	 Output: An array B[], B[i] is the maximum value of from A[i] to A[i+w-1]
//	 Requirement: Find a good optimal way to get B[i]

	@Test
	public void testMoveWindowAndReturnMaxCase1() {
		int[] input = { 1, 3, -1, -3, 5, 3, 6, 7 };
		int windowSize = 3;
		int[] maxValues = SlidingWindowMaximumFinder.moveWindowAndReturnMax(
				input, windowSize);

		assertArrayEquals(new int[] { 3, 3, 5, 5, 6, 7 }, maxValues);
	}
	
	@Test
	public void testMoveWindowAndReturnMaxCase2() {
		int[] input = { 1, 3, -1, -3, 5, 3, 6, 7 };
		int windowSize = 2;
		int[] maxValues = SlidingWindowMaximumFinder.moveWindowAndReturnMax(
				input, windowSize);

		assertArrayEquals(new int[] { 3, 3, -1, 5, 5, 6,7 }, maxValues);
	}

}
