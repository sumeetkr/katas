using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Katas_Console;

namespace Katas_UnitTestV10
{
    [TestClass]
    public class UnimodalArray_Test
    {
        [TestMethod]
        public void TestMethod1()
        {

            int [] array = new []{1,3,5,6,8,5,3,2};

            int max = UnimodalArray.GetMaximum(array);

            Assert.IsTrue(max == 8);
        }
    }
}
