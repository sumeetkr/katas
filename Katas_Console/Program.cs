using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Katas_Console
{
    class Program
    {
        static void Main(string[] args)
        {
            var  boardMatrix = new int[][] 
            {
                new int[] {1,3,5,7,9},
                new int[] {0,2,4,6,3},
                new int[] {11,22,2,3,5}
            };
            HeaviestPathInMatrixFinder.PrintBoard(boardMatrix);
        }
    }
}
