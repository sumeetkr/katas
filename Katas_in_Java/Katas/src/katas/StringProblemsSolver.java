package katas;

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
}
