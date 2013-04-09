package katas;

import java.util.HashMap;

public class TwoSumProblemSolver {
	
	 public static int[] twoSum(int[] numbers, int target) {
	        // Start typing your Java solution below
	        // DO NOT write main() function
	        
	        int[] returnArray = new int[2];
	        
	        
	        HashMap<Integer, Integer> hash = new HashMap<Integer, Integer>();
	        
	        for(int i = 0; i < numbers.length; i++){
	            hash.put(new Integer(numbers[i]), new Integer(i));
	        }
	        
	        int index = 0;
	        
	        for(int number : numbers){
	            if(hash.containsKey(new Integer(target - number))){
	                returnArray[0] = hash.get(number);
	                returnArray[1] = hash.get(target - number);
	                break;
	            }
	        }
	        
	        return returnArray;
	        
	    }

}
