using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Katas_Console
{
    public class FibonacciSeriesGenerator
    {
        public List<int> Generate(int p)
        {
            //F(n+1) = F(n) + F(n-1);
            //1,1,2,3,5,8,13

            List<int> series = new List<int>();
            for (int i = 0; i < p; i++)
            {
                series.Add(F(i));
            }

            return series;
        }

        private int F(int a)
        {
            if (a == 0) return 1;
            if (a == 1) return 1;

            return F(a - 1) + F(a-2);
        }
    }
}
