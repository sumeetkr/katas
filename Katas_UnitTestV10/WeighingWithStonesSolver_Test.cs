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
            List<int> dividedWeights = weighingWithStonesSolver.GetStones(initialWeight);
            return dividedWeights;
        }

        [TestMethod]
        public void Test_GetDividedWeightsFor40()
        {
            var weight = 40;
            List<int> dividedWeights = GetDividedWeights(weight);
            Assert.IsTrue(dividedWeights.Contains(3));
            Assert.IsTrue(dividedWeights.Contains(9));
            Assert.IsTrue(dividedWeights.Contains(27));
        }

        [TestMethod]
        public void Test_WhenWeightIsZero_ReturnsNull()
        {
            var weight = 0;
            List<int> dividedWeights = GetDividedWeights(weight);
            Assert.IsTrue(dividedWeights.Count == 0);
        }


        [TestMethod]
        public void Test_DividedWeightsForForty_CanMeasure17()
        {
            var weight = 40;

            List<int> dividedWeights = GetDividedWeights(weight);

            var weighingWithStonesSolver = new WeighingWithStonesSolver();
            bool isMeasured = weighingWithStonesSolver.CanStonesMeasureThisWeight(17, dividedWeights);

            Assert.IsTrue(isMeasured);
        }

        [TestMethod]
        public void Test_DividedWeightsFor40_CanMeasureAnyWeights()
        {
            var weight = 40;

            List<int> dividedWeights = GetDividedWeights(weight);
            var weighingWithStonesSolver = new WeighingWithStonesSolver();

            bool isMeasurable = true;
            for (int i = 0; i < weight; i++)
            {
                isMeasurable = weighingWithStonesSolver.CanStonesMeasureThisWeight(i, dividedWeights);
                Assert.IsTrue(isMeasurable);
            }

        }

        [TestMethod]
        public void Test_WronglyDividedWeightsFor40_CanMeasureAnyWeights()
        {

            List<int> dividedWeights = new List<int> {1, 3, 9, 29 };

            var weighingWithStonesSolver = new WeighingWithStonesSolver();

            bool isMeasurable = true;

             isMeasurable = weighingWithStonesSolver.CanStonesMeasureThisWeight(15, dividedWeights);
                Assert.IsFalse(isMeasurable);

        }


    }
}
