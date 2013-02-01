using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Katas_Console;

namespace Katas_UnitTestV10
{
    [TestClass]
    public class LongestIncreasingSubSequence_Test
    {
        [TestMethod]
        public void TestMethod1()
        {
            List<int> sequence = new List<int> { 3, 1, 4, 7, 6, 5, 9, 5 };
            var sequenceSolver = new LongestIncreasingSubSequenceSolver();
            //1,4,6,9
            //3,4,6,9


        }
    }
}
