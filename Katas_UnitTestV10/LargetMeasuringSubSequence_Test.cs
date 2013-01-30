using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Katas_Console;

namespace Katas_UnitTestV10
{
    [TestClass]
    public class LargestMeasuringSubSequence_Test
    {
        [TestMethod]
        public void TestMethod1()
        {
            List<int> sequence = new List<int> { 2, 5, -3, 7, 8, 2, -10, 2, -2, 4 };
            var sequenceSolver = new LargestMeasuringSubSequenceSolver();
        }
    }
}
