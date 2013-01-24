using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Katas_Console;
using System.Collections.Generic;

namespace Katas_UnitTests
{
    [TestClass]
    public class WeighingWithStonesSolver_Test
    {
        private List<int> GetDividedWeights(int initialWeight)
        {

            var weighingWithStonesSolver = new WeighingWithStonesSolver();
            List<int> dividedWeights = weighingWithStonesSolver.GetWeights(initialWeight);

            return dividedWeights;
        }



        [TestMethod]
        public void Test_GetDividedWeights()
        {
            var weight = 40;

            List<int> dividedWeights = GetDividedWeights(weight);

            Assert.IsFalse(dividedWeights.Count < 2);

        }

        [TestMethod]
        public void Test_CheckIfDividedWeightsAreNone()
        {
            var weight = 0;
            List<int> dividedWeights = GetDividedWeights(weight);

            var weighingWithStonesSolver = new WeighingWithStonesSolver();

            for (int i = 0; i < weight; i++)
            {
                bool isMeasured = weighingWithStonesSolver.CheckIfStonesCanMeasureThisWeight(i, dividedWeights);

                Assert.IsFalse(isMeasured);

                if (!isMeasured) return;
            }
        }

        [TestMethod]
        public void Test_CheckIfDividedWeightsIsJustOne()
        {
            var weight = 2;
            List<int> dividedWeights = GetDividedWeights(weight);

            var weighingWithStonesSolver = new WeighingWithStonesSolver();

            for (int i = 0; i < weight; i++)
            {
                bool isMeasured = weighingWithStonesSolver.CheckIfStonesCanMeasureThisWeight(i, dividedWeights);

                Assert.IsFalse(isMeasured);

                if (!isMeasured) return;
            }
        }

        [TestMethod]
        public void Test_CheckIfDividedWeightsCanMeasureTotalWeight()
        {
            var weight = 40;

            List<int> dividedWeights = GetDividedWeights(weight);

            var weighingWithStonesSolver = new WeighingWithStonesSolver();

            bool isMeasured = weighingWithStonesSolver.CheckIfStonesCanMeasureThisWeight(weight, dividedWeights);

            Assert.IsTrue(isMeasured);

        }

        [TestMethod]
        public void Test_CheckIfDividedWeightsCanMeasureAllTheWeight()
        {
            var weight = 40;

            List<int> dividedWeights = GetDividedWeights(weight);

            var weighingWithStonesSolver = new WeighingWithStonesSolver();

            bool isMeasurable = true;
            for (int i = 0; i < weight; i++)
            {
                isMeasurable = weighingWithStonesSolver.CheckIfStonesCanMeasureThisWeight(i, dividedWeights);
                Assert.IsTrue(isMeasurable);
            }

        }

        [TestMethod]
        public void Test_CheckIfWronglyDividedWeightsCanMeasureAllTheWeight()
        {

            List<int> dividedWeights = new List<int> {1, 3, 9, 29 };

            var weighingWithStonesSolver = new WeighingWithStonesSolver();

            bool isMeasurable = true;

             isMeasurable = weighingWithStonesSolver.CheckIfStonesCanMeasureThisWeight(15, dividedWeights);
                Assert.IsTrue(isMeasurable);

        }


    }
}
