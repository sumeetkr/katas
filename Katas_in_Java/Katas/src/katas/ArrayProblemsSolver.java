package katas;

public class ArrayProblemsSolver {

	public static int[] moveWindowAndReturnMax(int[] values, int windowSize) {
		int[] maxValues = new int[values.length - windowSize + 1];

		int maxValue = findMax(values, 0, windowSize - 1);
		int secondMaxValue = maxValue;

		int windowStartIndex = 0;
		int windowEndIndex = windowStartIndex + windowSize - 1;

		while (windowStartIndex < maxValues.length) {
//			// changes because of new entry
//			int valueOfNewEntry = values[windowStartIndex + windowSize -1];
//			if (valueOfNewEntry > maxValue) {
//				secondMaxValue = maxValue;
//				maxValue = valueOfNewEntry;
//			} else if (valueOfNewEntry > secondMaxValue) {
//				secondMaxValue = valueOfNewEntry;
//			}

			 maxValue = findMax(values, windowStartIndex, windowStartIndex
			 + windowSize - 1);

			maxValues[windowStartIndex] = maxValue;
			windowStartIndex++;
		}

		return maxValues;
	}

	public static int findNumber(int [] input, int target){
		// calculate distance
				// if bigger move right by distance else move left by distance
				int currentIndex = 0;
				int distance = Math.abs(target - input[currentIndex]);
				while(distance>0 && currentIndex<input.length -1 && currentIndex >= 0){
					distance = Math.abs(5 - input[currentIndex]);
					
					if(target > input[currentIndex]){
						currentIndex += distance;
					}else
					{
						currentIndex -= distance;
					}
				}
				
				if(input[currentIndex] == target ){
					return currentIndex;
				}
				
				return -1;
	}
	
	public static int findKthElementInUnionOfTwoSortedArrays(int[] first, int[] second, int k) {
		int firstIndex = k;
		int secondIndex = k;

		while (firstIndex + secondIndex != k) {

			if (first[firstIndex + 1] < second[secondIndex]) {
				firstIndex += 1;
				secondIndex -= 1;

			} else if (second[secondIndex + 1] < first[firstIndex]) {
				firstIndex -= 1;
				secondIndex += 1;
			} else {
				break;
			}
		}
		
		return first[firstIndex] >second[secondIndex] ? first[firstIndex]:second[secondIndex];
	}
	
	
	
	private static int findMax(int[] values, int startIndex, int endIndex) {
		int max = values[startIndex];
		for (int index = startIndex; index <= endIndex; index++) {
			if (max < values[index])
				max = values[index];
		}
		return max;
	}
}
