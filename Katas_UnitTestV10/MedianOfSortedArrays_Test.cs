using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Katas_UnitTestV10
{
    [TestClass]
    public class MedianOfSortedArrays_Test
    {
        [TestMethod]
        public void TestMethod1()
        {

            int[] firstArray = new int[] { 1, 2, 3, 4, 5, 40, 80, 81 };
            int[] secondArray = new int[] { 3, 4, 6, 7 };

            //Median of merged array
            //Median wiil more than (m+n)/2 adn less that (m+n)/2

            //int index = BinarySearch(firstArray, 81);

            //divide the arrays recusively
            //the medians will be in between the medians of two array


        }

        int FindMedianOfTwoArrays(int[] firstArray, int[] secondArray, int firstArrayStartIndex,
            int firstArrayEndIndex,
            int secondArrayStartIndex,
            int secondArrayEndIndex)
        {

            return 1;

        }



        private int BinarySearch(int[] array, int integerToSearch)
        {
            int index = (array.Length - 1) / 2;
            if (BinarySearchHelper(array, integerToSearch, 0, array.Length - 1, ref index))
            {
                return index;
            }
            else
            {
                throw new IndexOutOfRangeException();
            }
        }

        private bool BinarySearchHelper(int[] array, int integerToSearch, int startIndex, int lastIndex, ref int currentIndex)
        {
            int currentVal = array[currentIndex];
            if (currentVal == integerToSearch) return true;

            if (currentVal > integerToSearch)
            {
                lastIndex = currentIndex;
            }
            else
            {
                startIndex = currentIndex;
            }

            currentIndex = (startIndex + lastIndex + 1) / 2;
            return BinarySearchHelper(array, integerToSearch, startIndex, lastIndex, ref currentIndex);
        }
    }
}
