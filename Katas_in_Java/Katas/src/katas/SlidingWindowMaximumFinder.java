package katas;

public class SlidingWindowMaximumFinder {

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

	private static int findMax(int[] values, int startIndex, int endIndex) {
		int max = values[startIndex];
		for (int index = startIndex; index <= endIndex; index++) {
			if (max < values[index])
				max = values[index];
		}
		return max;
	}
}
