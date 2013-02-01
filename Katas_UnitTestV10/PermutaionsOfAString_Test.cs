using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Katas_Console;

namespace Katas_UnitTestV10
{
    [TestClass]
    public class PermutaionsOfAString_Test
    {
        [TestMethod]
        public void Test_SmallString()
        {
            string str = "abc";
            List<string> strings = PermutationsOfAString.GetPermutations(str);
            Assert.IsTrue(strings.Contains("bac"));
            Assert.IsTrue(strings.Count == 6);
        }

        [TestMethod]
        public void Test_String2()
        {
            string str = "abcde";
            List<string> strings = PermutationsOfAString.GetPermutations(str);
            Assert.IsTrue(strings.Contains("deabc"));
            Assert.IsTrue(strings.Count == 120);
        }
    }
}
