require "spec_helper"
require "../Katas/knap_sack_problem_solver"

describe "KnapSackProblemSolver behaviour" do

  #Mathematically the 0-1-knapsack problem can be formulated as:
  #Let there be  items,  to  where  has a value  and weight . The maximum weight that
  #we can carry in the bag is W. It is common to assume that all values and weights are nonnegative.
  #To simplify the representation, we also assume that the items are listed in increasing order of weight.
  #Maximize the sum of the values of the items in the knapsack so that the sum of the weights
  #must be less than the knapsack's capacity.

  context Item do
    before(:each) do
      @item = Item.new(10, 5)
    end

    subject(:item) { @item }

    it { should respond_to(:value) }
    it { should respond_to(:weight) }
  end

  describe "KnapSackProblemSolver" do
    before(:each) do
      items = [Item.new(10, 6), Item.new(12, 5), Item.new(20, 4), Item.new(8, 3), Item.new(8, 2), Item.new(3, 1)]
      @problem_solver = KnapSackProblemSolver.new(items)
    end

    subject { @problem_solver }

    it { should respond_to(:items) }

    context "brute force solver" do
      it "should solve to return maximum possible value- case 1" do
        value = @problem_solver.solve_using_brute_force(1)

        value.should equal(3)
      end

      it "should solve to return maximum possible value - case 2" do
        value = @problem_solver.solve_using_brute_force(6)

        value.should equal(28)
      end

      it "should solve to return maximum possible value - case 3" do
        value = @problem_solver.solve_using_brute_force(8)

        value.should equal(31)
      end

    end

    context "solve iteratively" do
      it "should solve to return maximum possible value- case 1" do
        value = @problem_solver.solve_iteratively(1)

        value.should equal(3)
      end

      it "should solve to return maximum possible value - case 2" do
        value = @problem_solver.solve_iteratively(6)

        value.should equal(28)
      end

      it "should solve to return maximum possible value - case 3" do
        value = @problem_solver.solve_iteratively(8)

        value.should equal(31)
      end
    end
  end

end