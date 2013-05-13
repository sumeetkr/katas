import static org.junit.Assert.*;
import katas.DynamicProgramming;

import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

public class DynamicProgrammingTest {

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void testMaxWeightIndependentSetOfGraph() {
		int[] weights = { 1, 3, 5, 7, 3, 1, 8, 9, 2, 11, 9 };

	}

	public void getMaxIndependentSet(int[] weights) {
		int[] subProblemsSolution = new int[11];
		int sum = 0;

	}

	@Test
	public void testLongestIncreasingSubsequence() {
		//
		int[] sequence = { 1, 3, 5, 7, 4, 1, 8, 9, 2, 11, 9, 4, 18, 7 };
				  // ans = 1, 2, 3, 4, 3, 1, 5, 6, 2, 7, 6, 3, 8, 4

		int[] subProblemsCount = new int[14];

		for (int i = 0; i < sequence.length; i++) {
			DynamicProgramming.findLongestIncreasingSubsequence(sequence, i, subProblemsCount);
		}

		assertTrue(subProblemsCount[12] == 8);
	}

	@Test
	public void testCoinFinder(){
		//Given a list of N coins, their values (V1, V2, ... , VN), and the total sum S. 
		//Find the minimum number of coins the sum of which is S (we can use as many coins of one type as we want),
		//or report that it's not possible to select coins in such a way that they sum up to S.
		
		int [] coins = {1,2,5,10, 20, 25};
		int value = 53;
		int [] memoizedValues = new int [value];
		int numberOfCoins = DynamicProgramming.getMinCoinsCount(value,coins, memoizedValues );
		
		assertEquals(2, numberOfCoins);
	}
	
	@Test
	public void findMaxValueContigousSum(){
		//Maximum Value Contiguous Subsequence. Given a sequence of n real numbers A(1) ... A(n), 
		//determine a contiguous subsequence A(i) ... A(j) for which the sum of elements in
		//the subsequence is maximized.
		
		int[] sequence = { 1, 3, -5, 7, -4, 1, -8, 9, -2, 11, -9, 4, -18, 7 };
		int[] maxValues = DynamicProgramming.findMaxValueContigousSum(sequence);
		
	
		assertEquals(3, maxValues[4]);
	}
	
	@Test
	public void findMaxBoxStacking(){
		//Box Stacking. You are given a set of n types of rectangular 3-D boxes, 
		//where the i^th box has height h(i), width w(i) and depth d(i) (all real numbers). 
		//You want to create a stack of boxes which is as tall as possible, but you can only 
		//stack a box on top of another box if the dimensions of the 2-D base of the
		//lower box are each strictly larger than those of the 2-D base of the higher box. 
		//Of course, you can rotate a box so that any side functions as its base. 
		//It is also allowable to use multiple instances of the same type of box.
		
		DynamicProgramming.Box [] boxes = {
				new DynamicProgramming.Box(10, 14, 15),
				new DynamicProgramming.Box(4, 8, 10),
				new DynamicProgramming.Box(2, 8, 5),
				new DynamicProgramming.Box(2, 6, 8),
				new DynamicProgramming.Box(1, 4, 5),
				new DynamicProgramming.Box(2, 5, 8),
				new DynamicProgramming.Box(2, 5, 7)};
		
		
		int [] boxesStackedForSubProblems = new int [boxes.length];
		boxesStackedForSubProblems[0] = 1;
		
		for (int i = 1; i < boxes.length; i++) {
			
			int max =1;
			for (int j = 0; j < i; j++) {
				if(DynamicProgramming.Box.isSecondSmaller(boxes[j],boxes[i]) && max < boxesStackedForSubProblems[j] +1){
					max = boxesStackedForSubProblems[j] +1;
				}
			}
			boxesStackedForSubProblems[i] = max;
		}
	
		assertEquals(4, boxesStackedForSubProblems[4]);
		
		
	}
	
	
	@Test
	public void findMaxPairsOfZeroAndOne(){
		//000110100101001010101010001011011010111
	}
}
