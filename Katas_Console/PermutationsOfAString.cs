using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Katas_Console
{
    public class PermutationsOfAString
    {
        public static List<string> GetPermutations(string str)
        {
            List<string> permutations = new List<string> { str };
            Permuatate(str.ToArray<char>(), str.Length, permutations);

            return permutations;
        }

        private static void Permuatate(char[] str,
                                        int index,
                                        List<string> permutations)
        {
            if (index == 1) return;

            char charAtIndex = str[index - 1];
            for (int i = 0; i < index - 1; i++)
            {
                //swap
                char temp = str[i];
                str[i] = charAtIndex;
                str[index - 1] = temp;

                permutations.Add(new string(str));

                //swap it back, get the 
                str[i] = temp;
                str[index - 1] = charAtIndex;

            }

            index = index - 1;
            Permuatate(str, index, permutations);
        }
    }
}
