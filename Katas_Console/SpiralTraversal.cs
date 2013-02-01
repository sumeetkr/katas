using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Katas_Console
{
    public class SpiralTraversal
    {
        public static void TraverseSpiral(int[][] matrix)
        {

            //traverse the shell in recursion

        }

        public static string TraverseShell(int[][] matrix, int cornerCellIndex)
        {
            //corner cell is matrix[cornerCellIndex][cornerCellIndex]

            string traversedPath = string.Empty;
            int totalColumns = matrix.Length;
            int totalRows = matrix[0].Length;

            if (cornerCellIndex >= totalColumns / 2) return traversedPath + matrix[cornerCellIndex][cornerCellIndex];

            for (int currentCol = cornerCellIndex; currentCol < totalColumns - cornerCellIndex; currentCol++)
            {
                traversedPath = string.Format("{0},",
                    traversedPath + matrix[currentCol][cornerCellIndex]);
            }

            for (int currentrow = cornerCellIndex; currentrow < totalRows - cornerCellIndex -1; currentrow++)
            {
                traversedPath = string.Format("{0},",
                    traversedPath + matrix[totalColumns - cornerCellIndex -1][currentrow +1]);
            }

            for (int currentCol =totalColumns- cornerCellIndex -2; currentCol >  cornerCellIndex; currentCol--)
            {
                traversedPath = string.Format("{0},",
                    traversedPath + matrix[currentCol][totalRows- cornerCellIndex -1]);
            }

            for (int currentrow =totalRows- cornerCellIndex -1; currentrow > cornerCellIndex ; currentrow--)
            {
                traversedPath = string.Format("{0},",
                    traversedPath + matrix[  cornerCellIndex ][currentrow - 1]);
            }
            return traversedPath + TraverseShell(matrix, cornerCellIndex +1) ;
        }
    }
}
