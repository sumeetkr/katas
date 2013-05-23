package katas;

import java.util.HashMap;
import java.util.LinkedHashMap;

public class StringProblemsSolver {

	public static String findLongestSubSequenceWithUniqueChars(String input){

		LinkedHashMap<Character, Boolean> map = new LinkedHashMap<Character, Boolean>();
		for (Character currentChar : input.toCharArray()) {
			map.put(currentChar, true);
		}
		
		StringBuilder stringBuilder = new StringBuilder();
		for(Character key:map.keySet()){
			stringBuilder.append(key);
		}
		
		return stringBuilder.toString();
	}
	
	public static String findLongestSubStringWithUniqueChars(String input){
		int leftIndex = 0;
		int rightIndex = 0;
		int maxSubStringStartIndex = 0;
		int maxSubStringEndIndex = 0;
		int currentSubStringLength = 0;
		int maxSubStringLength = 0;
		char[] inputChars = input.toCharArray();
		
		//expandWindowTillADuplicateAreFound
		//update maxSubstrin
		//reinitializeWindow
		//
		
		HashMap< Character, Boolean> hashMap = new HashMap<Character, Boolean>();
		
		while(rightIndex <input.length())
		{
			if(hashMap.containsKey(inputChars[rightIndex])){
				//duplicate found
				//update max window
				if((maxSubStringEndIndex - maxSubStringStartIndex)
						< (rightIndex -leftIndex -1)){
					maxSubStringStartIndex = leftIndex;
					maxSubStringEndIndex = rightIndex -1;
				}
				leftIndex = rightIndex;
				hashMap.clear();
			}
			else{
				hashMap.put(inputChars[rightIndex], true);
			}
			
			rightIndex++;
		}
		
		//final check, update max window
		if((maxSubStringEndIndex - maxSubStringStartIndex)
				< (rightIndex -leftIndex)){
			maxSubStringStartIndex = leftIndex;
			maxSubStringEndIndex = rightIndex;
		}
		
		return input.substring(maxSubStringStartIndex, maxSubStringEndIndex);
		
	}
	
	public static char[][] getInZigZagFormat(int rowCount, char[] inputChars) {
		char[][] matrix = new char[inputChars.length][rowCount];

		boolean isGoingDown = true;
		boolean isGoingSlant = false;

		int currentCol = 0;
		int i = 0;
		while (i < inputChars.length) {
			if (isGoingDown) {
				for (int downIndex = 0; (downIndex < rowCount) && (i < inputChars.length); downIndex++) {
					matrix[currentCol][downIndex]= inputChars[i];
					i++;
				}
				currentCol++;
			}

			if (isGoingSlant) {
				for (int upIndex = rowCount -2; (upIndex > 0) && (i < inputChars.length); upIndex--) {
					matrix[currentCol][upIndex]= inputChars[i];
					i++;
					currentCol++;
				}
			}

			isGoingDown = !isGoingDown;
			isGoingSlant = !isGoingSlant;
		}
		
		return matrix;
	}
	
	public static boolean hasSubString(String mainString, String subString) {
		boolean isThere = false;
		
		char [] chars = mainString.toCharArray();
		char [] subStringChars = subString.toCharArray();
		
		for (int i = 0; i < chars.length; i++) {
			
			isThere = true;
			for (int j = 0; j < subStringChars.length; j++) {
				if(i+j > chars.length || chars[i+j] != subStringChars[j]) {
					isThere = false;
					break;
				}
			}
			
			if(isThere) break; 
		}
		
		return isThere;
	}
}
