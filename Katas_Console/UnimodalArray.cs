using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Katas_Console
{
    public class UnimodalArray
    {
        //You are a given a unimodal array of n distinct elements, 
        //meaning that its entries are in increasing order up until its maximum element, 
        //after which its elements are in decreasing order. 
        //Give an algorithm to compute the maximum element that runs in O(log n) time.

        public static int GetMaximum(int[] array)
        {
            //Get the middle point, check if it is increasing or decreasing
           return TraverseArray(array, 0, array.Length - 1);
        }

        private static int TraverseArray(int[] array, int startIndex, int endIndex)
        {
            if (startIndex == endIndex) return array[startIndex];
            if (array[startIndex] == array[endIndex]) return array[startIndex];

            if (array[startIndex] < array[startIndex + 1])
            {
                startIndex = (startIndex + endIndex + 1) / 2;
            }
            
            if (array[endIndex] < array[endIndex - 1])
            {
                endIndex = (startIndex + endIndex + 1) / 2;
            }

            return TraverseArray(array, startIndex, endIndex);

        }
    }
}
