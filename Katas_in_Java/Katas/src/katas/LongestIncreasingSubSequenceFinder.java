package katas;

import java.util.Arrays;
import java.util.List;
import java.util.Vector;

public class LongestIncreasingSubSequenceFinder {

	public int findLength(int[] inputSequence) {
		int[] ithSubProblemSolutions = new int[inputSequence.length];

		for (int inputIndex = 0; inputIndex < inputSequence.length; inputIndex++) {
			int max = 1;

			for (int innerIndex = 0; innerIndex < inputIndex; innerIndex++) {
				
				if (inputSequence[inputIndex] > inputSequence[innerIndex]) {
					if (ithSubProblemSolutions[innerIndex] >= max) {
						max = ithSubProblemSolutions[innerIndex] + 1;
					}
				}
			}

			ithSubProblemSolutions[inputIndex]= max;
		}

		return getMax(ithSubProblemSolutions);
	}

	public int[] toIntArray(List<Integer> list) {
		int[] ret = new int[list.size()];
		for (int i = 0; i < ret.length; i++)
			ret[i] = list.get(i);
		return ret;
	}
	
	public int getMax(int[] input){
		int max = 0;
		
		for(int number:input){
			if(number>max) max= number;
		}
		
		return max;
	}
}
