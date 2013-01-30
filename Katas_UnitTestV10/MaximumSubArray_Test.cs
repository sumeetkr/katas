using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Katas_Console;

namespace Katas_UnitTestV10
{
    [TestClass]
    public class MaximumSubArray_Test
    {
        [TestMethod]
        public void TestMethod1()
        {
            List<int> seq = new List<int> { 2, 4, -6};
            var solver = new MaximumSubArraySolver();
            List<int> maxSubArray = solver.GetMaximumSubArray(seq);
            Assert.IsTrue(maxSubArray.Contains(2));
            Assert.IsTrue(maxSubArray.Contains(4));

        }

        [TestMethod]
        public void TestMethod2()
        {
            List<int> seq = new List<int> { 2, 4, -6 };
            var solver = new MaximumSubArraySolver();
            int maxSum = solver.GetMaximumSubArraySum(seq);

            Assert.IsTrue(maxSum == 6);
        }

        [TestMethod]
        public void TestMethod3()
        {
            List<int> seq = new List<int> { 2, 8, -6, 5, 7, -4, 3, -4, 6 };
            var solver = new MaximumSubArraySolver();
            int maxSum = solver.GetMaximumSubArraySum(seq);

            Assert.IsTrue(maxSum == 17);
        }
    }
}
