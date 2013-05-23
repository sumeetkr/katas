package katas;

import static org.junit.Assert.assertEquals;

import java.util.PriorityQueue;

public class DynamicProgramming {

	public static int getMinCoinsCount(int value, int [] values, int [] memoizedValues){
		if(value == 0) return 0;
		if(value < 0) return 1000;// big number
		
		int minCount = value;
		for (int i = 0; i < values.length; i++) {
			if(value - values[i] -1 > 0 && memoizedValues[value - values[i] -1] >0){
				minCount = memoizedValues[value - values[i] -1];
			}
			else
			{
				int count = getMinCoinsCount(value - values[i],  values, memoizedValues);
				if(count < minCount){
					minCount = count;
				}	
			}
		}
		
		memoizedValues[value -1] = minCount + 1;
		
		return minCount +1;
	}
	
	public static void findLongestIncreasingSubsequence(int[] sequence, int index,
			int[] subProblemsCount) {

		if (index > sequence.length - 1)
			return;

		if (index == 0) {
			subProblemsCount[0] = 1;
			return;
		}

		int val = sequence[index];
		int currentMaxCount = 0;

		for (int i = 0; i < index; i++) {
			if (val > sequence[i] && currentMaxCount < subProblemsCount[i]) {
				currentMaxCount = subProblemsCount[i];
			}
		}

		subProblemsCount[index] = currentMaxCount + 1;

	}
	
	public static int[] findTallestStack(DynamicProgramming.Box[] boxes) {
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
		return boxesStackedForSubProblems;
	}
	
	public static int[] findMaxValueContigousSum(int[] sequence) {
		int [] maxValues = new int[sequence.length];
		maxValues[0] = sequence[0];
		
		for (int i = 1; i < sequence.length; i++) {
			maxValues[i] = Math.max(maxValues[i-1] + sequence[i], sequence[i]);
		}
		return maxValues;
	}

	public static String buildBridgesAcrossCities(int[] citiAXCoords) {
		String [] cities = new String[citiAXCoords.length];
		
		// need to find the longest increasing subsequence of A
		int [] subProblemsSolution = new int[5];
		subProblemsSolution[0] = 1;
		cities[0] = Integer.toString(citiAXCoords[0]);
		
		for (int i = 1; i < citiAXCoords.length; i++) {
			int maxCount = 1;
			String city ="";
			for (int j = 0; j < i; j++) {
				if(citiAXCoords[j] < citiAXCoords[i] && maxCount< subProblemsSolution[j] + 1) {
					maxCount = subProblemsSolution[j] + 1;
					city = cities[j];
				}
			}
			subProblemsSolution[i] = maxCount;
			cities[i] = city + citiAXCoords[i];
		}
		
		
		int maxLength = 0;
		String citiesForBridges = "";
		for (String s : cities) {
			if(s.length() > maxLength) {
				maxLength = s.length();
				citiesForBridges = s;
			}
		}
		
		return citiesForBridges;
	}
	
	public static class Box{
		private int length = 0;
		private int width = 0;
		private int height = 0;
		
		public Box(int length, int width, int height){
			this.setLength(length);
			this.setWidth(width);
			this.setHeight(height);
		}

		int getLength() {
			return length;
		}

		void setLength(int length) {
			this.length = length;
		}

		int getWidth() {
			return width;
		}

		void setWidth(int width) {
			this.width = width;
		}

		int getHeight() {
			return height;
		}

		void setHeight(int height) {
			this.height = height;
		}
		
		public static boolean isSecondSmaller(Box bigger, Box smaller){
			PriorityQueue<Integer> queueForBigger = new PriorityQueue<Integer>();
			queueForBigger.add(bigger.getLength());
			queueForBigger.add(bigger.getWidth());
			queueForBigger.add(bigger.getHeight());
			
			PriorityQueue<Integer> queueForSmaller = new PriorityQueue<Integer>();
			queueForSmaller.add(smaller.getLength());
			queueForSmaller.add(smaller.getWidth());
			queueForSmaller.add(smaller.getHeight());
			
			boolean isSecondSmaller = true;
			while(queueForBigger.iterator().hasNext()){
				if(queueForBigger.poll() < queueForSmaller.poll()){
					isSecondSmaller = false;
				}
			}
			
			return isSecondSmaller;
		}
	}
}
