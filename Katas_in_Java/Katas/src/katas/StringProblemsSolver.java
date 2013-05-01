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
}
