using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Katas_Console
{
    public class MaximumSubArraySolver
    {
        public List<int> GetMaximumSubArray(List<int> seq)
        {
            //4,6,-3,2,-1
            //shorten the array 10,-3,2, -1
            //formaula after discussion with Sean. Max(n) = Max{Max(n-1) + a(n), a(n)}

            int maxSum = 0;
            int sum = 0;
            List<int> maxSeq  = new List<int>();
            
            foreach (var item in seq)
            {
                sum = sum > item ? sum : item;
                maxSum = sum > maxSum ? sum : maxSum;
            }

            return maxSeq;
        }

        public int GetMaximumSubArraySum(List<int> seq)
        {
            int maxSum = 0;
            int sum = 0;

            foreach (var item in seq)
            {
                sum = sum +item > item ? sum + item : item;
                maxSum = sum > maxSum ? sum : maxSum;
            }

            return maxSum;
        }
    }
}
