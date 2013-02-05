using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Katas_Console;

namespace Katas_UnitTestV10
{
    [TestClass]
    public class Sorters_Test
    {
        [TestMethod]
        public void TestMethod1()
        {
            int[] firstArray = new int[] { 2, 4, 5, 6, 7 };

            int[] secondArray = new int[] { 1, 3, 5, 8, 9, 12 };

            var sortedArray = Sorters.Merge(firstArray, secondArray);
        }
    }
}
