using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Katas_Console
{
    public class Sorters
    {

        public static int[] MergeSort(int[] array)
        {
            int [] mergedArray = new int[10];

            return mergedArray;
        }

        public static int [] Merge(int[] firstArray, int[] secondArray)
        {
            int firstArrayLength = firstArray.Length;
            int secondArrayLength = secondArray.Length;
            int n = firstArrayLength + secondArrayLength;

            int firstArrayCurrentIndex = 0;
            int secondArrayCurrentIndex = 0;
            int[] sortedArray = new int[n];
            for (int i = 0; i < n; i++)
            {

                if (firstArrayCurrentIndex == firstArrayLength)
                {
                    while (secondArrayCurrentIndex < secondArrayLength)
                    {
                        sortedArray[i] = secondArray[secondArrayCurrentIndex];
                        secondArrayCurrentIndex++;
                        i++;
                    }
                    break;
                }

                if (secondArrayCurrentIndex == secondArrayLength)
                {
                    while (firstArrayCurrentIndex < firstArrayLength)
                    {
                        sortedArray[i] = firstArray[firstArrayCurrentIndex];
                        firstArrayCurrentIndex++;
                        i++;
                    }
                    break;
                }
                if (firstArray[firstArrayCurrentIndex] <= secondArray[secondArrayCurrentIndex])
                {
                    sortedArray[i] = firstArray[firstArrayCurrentIndex];
                    firstArrayCurrentIndex++;
                }
                else
                {
                    sortedArray[i] = secondArray[secondArrayCurrentIndex];
                    secondArrayCurrentIndex++;
                }

            }

            return sortedArray;
        }

    }
}
