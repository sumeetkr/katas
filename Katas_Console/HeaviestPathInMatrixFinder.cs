using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Katas_Console
{
    public class HeaviestPathInMatrixFinder
    {
        int[][] boardMatrix;

        public HeaviestPathInMatrixFinder()
        {
            boardMatrix = new int[][] 
            {
                new int[] {1,3,5,7,9},
                new int[] {0,2,4,6,3},
                new int[] {11,22,2,3,5}
            };
        }


        public static void AddWeightsToPath()
        {
            int[][] weightedMatrix = new int[][]
            {
                new int[] {0,0,0,0,0},
                new int[] {0,0,0,0,0},
                new int[] {0,0,0,0,0}
            };

            for (int colNo = 0; colNo < weightedMatrix.Length; colNo++)
            {
                
            }
            // add shells and calculate



            PrintBoard (weightedMatrix);
        }

        public static void PrintBoard(int [][] board)
        {

            for (int rowNo = 0; rowNo < board.Length; rowNo++)
            {
                int[] column = board[rowNo];
 
                for (int columnNo = 0; columnNo < column.Length; columnNo++)
                {
                    Console.Write(string.Format("{0}, ", board[rowNo][columnNo]));
                }
                Console.WriteLine();
            }
        }



    }
}
