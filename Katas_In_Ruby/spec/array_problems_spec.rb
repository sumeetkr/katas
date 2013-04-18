require "spec_helper"
require "../Katas/array_problems_solver"
require "../Katas/helpers"

describe "Array behaviour" do

  context "closest indices to sort array" do
    #Given an array of integers, write a method to find indices m and n such that
    #if you sorted elements m through n, the entire array would be sorted.
    # Minimize n - m (that is, find the smallest such sequence).
    it "should return closest indices to sort" do
      array = [1, 3, 5, 4, 3, 8, 9]
      indices_array = ArrayProblemsSolver.get_closest_indices_to_sort(array)
      indices_array[0].should == 2
      indices_array[1].should == 4
    end
  end

  context "max element of unimodal array" do
    it "should return the maximum element of unimodal array" do
      array = [2, 3, 5, 8, 6, 1]

      max_element = ArrayProblemsSolver.get_max_element_of_unimodal_array(array)
      max_element.should == 8

    end

    it "should return the maximum element of unimodal array" do
      array = [2, 3, 4, 9, 6, 3, 1, -2, -6, -8, -9]

      max_element = ArrayProblemsSolver.get_max_element_of_unimodal_array(array)
      max_element.should == 9

    end

  end

  context "rotate an array in place k times" do
    it " should rotate the array partially" do
      arr = ["a", "b", "c", "d", "e", "f", "g"]

      ArrayProblemsSolver.reverse_an_array(arr, 3, arr.length - 1)
      arr.should == ["a", "b", "c", "g", "f", "e", "d"]
    end

    it " should rotate the entire array" do
      arr = ["a", "b", "c", "d", "e", "f", "g", "h"]
      ArrayProblemsSolver.reverse_an_array(arr, 0, arr.length - 1)
      arr.length == 8
    end

    it " should rotate partial array" do
      arr = ["a", "b", "c", "d", "e", "f", "g", "h"]
      ArrayProblemsSolver.reverse_an_array(arr, 1, arr.length - 2)
      arr[6].should == "b"
    end

    it "should rotate an array in place k times" do
      arr = ["a", "b", "c", "d", "e", "f", "g"]
      k = 4
      ArrayProblemsSolver.rotate_an_array_k_times(arr, k)
      arr.should == ["d", "e", "f", "g", "a", "b", "c"]
    end
  end

  context "2 sum problem" do
    # The goal of this problem is to implement a variant of the 2-SUM algorithm (covered in the Week 6
    # lecture on hash table applications).
    # The file contains 500,000 positive integers (there might be some repetitions!).This is your array of
    # integers, with the ith row of the file specifying the ith entry of the array.
    # Your task is to compute the number of target values t in the interval [2500,4000]
    # (inclusive) such that there are distinct numbers x,y in the input file that satisfy x+y=t.
    # (NOTE: ensuring distinctness requires a one-line addition to the algorithm from lecture.)

    it "should find the correct integers that make the sum when there is unique solution" do
      array = [10, 12, 15, 20, 25, 34, 47]
      sum = 45

      is_there_a_solution = ArrayProblemsSolver.two_sum_problem(array, sum)
      is_there_a_solution.should be_true
    end

    it "should find the correct integers that make the sum when there are 2 solutions" do
      array = [10, 12, 15, 20, 25, 34, 47, 63, 100]
      sum = 110

      is_there_a_solution = ArrayProblemsSolver.two_sum_problem(array, sum)
      is_there_a_solution.should be_true
    end

    it "should find the correct integers that make the sum when there are 2 distinct solutions" do
      array = [10, 12, 15, 20, 25, 34, 47, 3, 35, 25, 40]
      sum = 50

      is_there_a_solution = ArrayProblemsSolver.two_sum_problem(array, sum)
      is_there_a_solution.should be_true
    end

    it " should find all distinct integers whose sum is in the range 30 - 60" do

      array = Helpers.populate_array_with_file_content("../Sample_Data/HashInt2.txt")
      array_filtered_and_sorted = []

      for number in array
        if (number <= 60)
          array_filtered_and_sorted << number
        end
      end
      array_filtered_and_sorted.sort()

      count_of_solutions = ArrayProblemsSolver.two_sum_problem_extended(array_filtered_and_sorted, 30, 60)
      count_of_solutions.should == 9
    end

    it " should find all distinct integers whose sum is in the range 60 - 100" do

      array = Helpers.populate_array_with_file_content("../Sample_Data/HashInt2.txt")
      array_filtered_and_sorted = []

      for number in array
        if (number <= 100)
          array_filtered_and_sorted << number
        end
      end
      array_filtered_and_sorted.sort()

      count_of_solutions = ArrayProblemsSolver.two_sum_problem_extended(array_filtered_and_sorted, 60, 100)
      count_of_solutions.should == 28
    end

    it "should read all the elements from the file" do
      array = Helpers.populate_array_with_file_content("../Sample_Data/HashInt.txt")
      array.length.should == 500000
    end

    it "should read all the elements and keep items less than 4000 and sort them" do
      array = Helpers.populate_array_with_file_content("../Sample_Data/HashInt.txt")
      array_filtered_and_sorted = []

      for number in array
        if (number <= 4000)
          array_filtered_and_sorted << number
        end
      end
      array_filtered_and_sorted.sort()

      array_filtered_and_sorted.length.should == 206
    end

    it " should find all distinct integers whose sum is in the range 2500 - 4000" do

      array = Helpers.populate_array_with_file_content("../Sample_Data/HashInt.txt")
      array_filtered_and_sorted = []

      for number in array
        if (number <= 4000)
          array_filtered_and_sorted << number
        end
      end
      array_filtered_and_sorted.sort()

      count_of_solutions = ArrayProblemsSolver.two_sum_problem_extended(array_filtered_and_sorted, 2500, 4000)
      count_of_solutions.should == 1477
    end
  end

  context "select ith order statistics" do

    array = [8, 3, 2, 5]
    ith_order_statistics = ArrayProblemsSolver.select_ith_order_statistics(array, 3)
    #ith_order_statistics.should == 5
  end

end