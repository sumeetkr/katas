import static org.junit.Assert.*;
import katas.ArrayProblemsSolver;
import org.junit.Test;

public class ArrayProblemsSolverTest {

	// A long array A[] is given to you. There is a sliding window of size w
	// which is
	// moving from the very left of the array to the very right. You can only
	// see
	// the w numbers in the window. Each time the sliding window moves
	// rightwards
	// by one position. Following is an example:
	// The array is [1 3 -1 -3 5 3 6 7], and w is 3.
	//
	// Window position Max
	// --------------- -----
	// [1 3 -1] -3 5 3 6 7 3
	// 1 [3 -1 -3] 5 3 6 7 3
	// 1 3 [-1 -3 5] 3 6 7 5
	// 1 3 -1 [-3 5 3] 6 7 5
	// 1 3 -1 -3 [5 3 6] 7 6
	// 1 3 -1 -3 5 [3 6 7] 7
	// Input: A long array A[], and a window width w
	// Output: An array B[], B[i] is the maximum value of from A[i] to A[i+w-1]
	// Requirement: Find a good optimal way to get B[i]

	@Test
	public void testMoveWindowAndReturnMaxCase1() {
		int[] input = { 1, 3, -1, -3, 5, 3, 6, 7 };
		int windowSize = 3;
		int[] maxValues = ArrayProblemsSolver.moveWindowAndReturnMax(input,
				windowSize);

		assertArrayEquals(new int[] { 3, 3, 5, 5, 6, 7 }, maxValues);
	}

	@Test
	public void testMoveWindowAndReturnMaxCase2() {
		int[] input = { 1, 3, -1, -3, 5, 3, 6, 7 };
		int windowSize = 2;
		int[] maxValues = ArrayProblemsSolver.moveWindowAndReturnMax(input,
				windowSize);

		assertArrayEquals(new int[] { 3, 3, -1, 5, 5, 6, 7 }, maxValues);
	}

	@Test
	public void testFindNumber() {
		// Given an array of integers such that each element is either +1 or -1
		// to its preceding element. Find 1st occurrence of a given number in
		// that array without using linear search.

		int[] input = { 1, 2, 3, 4, 5, 6, 5, 4 };
		int target = 5;
		int ans = ArrayProblemsSolver.findNumber(input, target);
		assertEquals(4, ans);

	}

	@Test
	public void testSwapNumbers() {
		// If [a1,a2,a3...,an,b1,b2...bn] is given input change this to
		// [a1,b1,a2,b2.....an,bn]
		// , solution should be in-place

		char[] chars = { 'a', 'b', 'c', 'd', 'e', 'f' };
		// First swap elements in the middle pair
		// Next swap elements in the middle two pairs
		// Next swap elements in the middle three pairs
		// iterate n-1 steps.

		// 0 1 2 3 4 5
		// 23
		// 12, 34
		// 01, 12, 23, 34, 45

		int n = chars.length / 2;
		for (int i = 0; i < n; i++) {
			for (int j = 0; j < i; j++) {
				// swap(n-i+2*j, n-i-2*j +1);
			}
		}

	}

	@Test
	public void testFindKthSortedElementInUnionOfTwoSortedArrays() {
		// Find the k-th Smallest Element in the Union of Two Sorted Arrays

		int[] first = { 1, 2, 5, 8, 10, 13 };
		int[] second = { 3, 7, 9, 11, 12, 15 };

		int k = 4;

		int ans = ArrayProblemsSolver.findKthElementInUnionOfTwoSortedArrays(first, second, k);
		assertEquals(5, ans);
	}
	
	@Test
	public void testMaximizeDistance() {
	//Given an array A of integers, find the maximum of j-i subjected to the constraint of A[i] < A[j].
		int [] input = {4, 2, 5, 2, 1, 3, 2, 3};
		
	}
	
	public int MaximizeDistanceBruteForce(int [] input) {
		int maxDistance = 0;
		
		
		
		return maxDistance;
	}

}
