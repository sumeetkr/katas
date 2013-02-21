require "spec_helper"
require "../Katas/array_problems"

describe "My behaviour" do

  it "should return closest indices to sort" do
    array = [1, 3, 5, 4, 3, 8, 9]
    indices_array = get_closest_indices_to_sort(array)
    indices_array[0].should == 2
    indices_array[1].should == 4
  end

  it "should return the maximum element of unimodal array" do
    array = [2, 3, 5, 8, 6, 1]

    max_element = ArrayProblemsSolver.get_max_element_of_unimodal_array(array)
    max_element.should == 8

  end

  it "should return the maximum element of unimodal array" do
    array = [2, 3, 4, 8, 6, 3, 1, -2, -6, -8, -9]

    max_element = ArrayProblemsSolver.get_max_element_of_unimodal_array(array)
    max_element.should == 8

  end

  context " " do
    #  Given an unsorted array of integers, find the length of the longest consecutive elements sequence.
    #  For example,
    #      Given [100, 4, 200, 1, 3, 2],
    #            The longest consecutive elements sequence is [1, 2, 3, 4]. Return its length: 4.
    #
    #                Your algorithm should run in O(n) complexity.


  end

  context "select ith order statistics" do

    array = [8, 3, 2, 5]
    ith_order_statistics = ArrayProblemsSolver.select_ith_order_statistics(array, 3)
    ith_order_statistics.should == 5
  end

end