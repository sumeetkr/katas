using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Katas_Console;

namespace Katas_UnitTestV10
{
    [TestClass]
    public class FibonacciSeriesGenerator_Test
    {
        [TestMethod]
        public void TestMethod1()
        {
            var seriesGenerator = new FibonacciSeriesGenerator();
            List<int> series = seriesGenerator.Generate(6);
            Assert.AreEqual<int>(series.ElementAt(4), 5);
            Assert.AreEqual<int>(series.ElementAt(5), 8);
        }
    }
}
