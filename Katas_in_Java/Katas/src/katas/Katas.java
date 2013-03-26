/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package katas;

import java.util.HashMap;

/**
 *
 * @author sumeet
 */
public class Katas {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        int[] numbers   =  {25, 50, 100, 150};
        int target = 125;
        
        int[] results = twoSum(numbers, target);
        
    }
    
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
