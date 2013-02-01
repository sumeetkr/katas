using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Katas_Console;

namespace Katas_UnitTestV10
{
    [TestClass]
    public class SpiralTraversal_Test
    {
        [TestMethod]
        public void TestMethod1()   
        {
            int[][] matrix = new int[][]
            {
                new int[] {0,0,0,0,0},
                new int[] {1,3,5,7,2},
                new int[] {7,3,6,5,4},
                new int[] {71,32,63,54,45},
                new int[] {76,37,68,59,40},
                new int[] {71,32,63,54,45}
            };


           var pathTraversed =  SpiralTraversal.TraverseShell(matrix, 0);

        }
    }
}
