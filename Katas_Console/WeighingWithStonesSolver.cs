using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Katas_Console
{
    public class WeighingWithStonesSolver
    {
        //Problem description
        //A farmer has a forty pound stone that he uses to weigh food for his animals on a scale.
        //One day, he loans the stone to his neighbor. A few days later, the neighbor returns the stone and
        //apologizes to the farmer because his stone is now broken in four pieces. 
        //The farmer responds “Please don’t apologize, you have actually made my life easier because with these 
        //four pieces, I can now measure any weight between one and forty pounds.

        //The question is: how much do these four individual pieces weigh?
        //I’m adding a few clarifications, which are not necessarily what the Car Talk guys meant (I don’t have the solution and I haven’t looked at any discussion on the subject):

        //The four weights are integers.
        //The weights we can measure between one and forty pounds are in one pound increment.
        //They are measured in one session (otherwise, you could measure forty pounds with a one pound stone by performing forty measurements).
        //If there is no solution (the farmer might be bad at math), show the four weights that allow to measure the most weights between one and forty pounds.

        public List<int> GetWeights(int weight)
        {
            // return a list of 3^0, 3^1, 3^2, ... less than weight

            List<int> weights = new List<int>();

            for (int i = 0; Math.Pow(3,i) < weight; i++)
            {
                weights.Add(Convert.ToInt32( Math.Pow(3,i)));
            }

            return weights;
        }

        public bool CheckIfStonesCanMeasureThisWeight(int weight, List<int> dividedWeights)
        {
            //boundry cases
            if (dividedWeights.Count == 0) return false;
            if (dividedWeights.Count == 1) return weight == dividedWeights.First();

            int maxWeight = 0;
            int totalWeight = 0;

            foreach (var dividedWeight in dividedWeights)
            {
                totalWeight = totalWeight + dividedWeight;
                if (maxWeight < dividedWeight) maxWeight = dividedWeight;
            }

            if (weight > totalWeight) return false;

            //make calculations
            bool isMeasurable = false;
           
            //they could be there, not there, or are there but on the other side, e.g. 1, 0, -1
            Operation(dividedWeights, 0, weight, 0, ref isMeasurable);
           

            return isMeasurable;

        }

        private void Operation(List<int> values, int listCurrentIndex, int desiredValue, int currentSum, ref bool matchFound)
        {
            if (currentSum == desiredValue)
            {
                matchFound = true;
                return;
            }

            if (listCurrentIndex == values.Count())
            {
                matchFound = false;
                return;
            }

            int val = values[listCurrentIndex];
            listCurrentIndex++;

            //+1
            if(!matchFound) Operation(values, listCurrentIndex, desiredValue, currentSum + val, ref matchFound);

            //-1
            if (!matchFound) Operation(values, listCurrentIndex, desiredValue, currentSum - val, ref matchFound);
            //0

            if (!matchFound) Operation(values, listCurrentIndex, desiredValue, currentSum, ref matchFound);

        }
    }
    
}
