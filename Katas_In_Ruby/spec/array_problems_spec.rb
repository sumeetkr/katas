require "spec_helper"
require "../Katas/array_problems_solver"

describe "Array behaviour" do

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
    #ith_order_statistics.should == 5
  end


  context "rotate an array in place" do
    arr = ["a", "b", "c", "d", "e", "f", "g"]
    k = 4
    ArrayProblemsSolver.rotate_an_array_k_times(arr, k)
    arr[0].should == "e"
  end

  context "reverse an array" do
    it " should rotate the entire array partially" do
      arr = ["a", "b", "c", "d", "e", "f", "g"]
      ArrayProblemsSolver.reverse_an_array(arr, 3, arr.length - 1)
      arr.length = 8
    end

    it " should rotate the entire array" do
      arr = ["a", "b", "c", "d", "e", "f", "g", "h"]
      ArrayProblemsSolver.reverse_an_array(arr, 0, arr.length - 1)
      arr.length = 8
    end

    it " should rotate partial array" do
      arr = ["a", "b", "c", "d", "e", "f", "g", "h"]
      ArrayProblemsSolver.reverse_an_array(arr, 1, arr.length - 2)
      arr[6].should == "b"
    end
  end

end