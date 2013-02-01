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

            int startIndexOfMaxSubArray = 0;
            int endIndexOfMaxSubArray = 0;

            for (int i = 0; i < seq.Count; i++)
            {
                int startIndex = startIndexOfMaxSubArray;
                int endIndex = endIndexOfMaxSubArray;

                if (sum + seq[i] > seq[i])
                {
                    sum = sum + seq[i];
                    endIndex = i;
                }
                else
                {
                    sum = seq[i];
                    startIndex = i;
                    endIndex = i;
                }

                if (sum > maxSum)
                {
                    maxSum = sum;

                    startIndexOfMaxSubArray = startIndex;
                    endIndexOfMaxSubArray = endIndex;
                }
            }

            List<int> maxSeq = new List<int>();
            for (int i = startIndexOfMaxSubArray; i < endIndexOfMaxSubArray; i++)
            {
                maxSeq.Add(seq[i]);
            }
            return maxSeq;
        }

        public int GetMaximumSubArraySum(List<int> seq)
        {
            int maxSum = 0;
            int sum = 0;

            for (int i = 0; i < seq.Count; i++)
            {

                if (sum + seq[i] > seq[i])
                {
                    sum = sum + seq[i];
                }
                else
                {
                    sum = seq[i];
                }

                if (sum > maxSum)
                {
                    maxSum = sum;
                }
            }

            return maxSum;
        }

    }
}
