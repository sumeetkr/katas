require "spec_helper"
require "../Katas/quick_sort"

describe "QuickSort behaviour" do

  it "should sort array" do
    array = [2, 1, 6, 4, 2, 9, 14, 3, 9, 0, -4]

    sorted_array = QuickSort.sort(array)

    sorted_array.should == [-4, 0, 1, 2, 2, 3, 4, 6, 9, 9, 14]

  end
  it "should sort array" do
    array = [40, 1, 6, 4, 2, 9, 14, 3, 9, 0, 34]

    sorted_array = QuickSort.sort(array)

    sorted_array.should == [0, 1, 2, 3, 4, 6, 9, 9, 14, 34, 40]

  end

  it "should sort the array" do
    array = [4, 1, 6, 3, 5, 2, 17]
    QuickSort.partition(array, 0, 6)
    array.should == [1, 2, 3, 4, 5, 6, 17]

  end

  context "count number of comparisons" do

    it "should correctly count total number of comparisons in small arrays" do
      array = [4, 1, 6, 3, 5, 2, 17]
      num_of_comparisons = QuickSort.partition(array, 0, array.length - 1)
      array.should == [1, 2, 3, 4, 5, 6, 17]
      num_of_comparisons.should == 11

    end

    it "should correctly count total number of comparisons in small arrays" do
      array = [4]
      num_of_comparisons = QuickSort.partition(array, 0, array.length - 1)
      array.should == [4]
      num_of_comparisons.should == 0

    end

    it "should correctly count total number of comparisons in small arrays" do
      array = [1, 2]
      num_of_comparisons = QuickSort.partition(array, 0, array.length - 1)
      array.should == [1, 2]
      num_of_comparisons.should == 1

    end

    it "should correctly count total number of comparisons in small arrays" do
      array = [2, 1]
      num_of_comparisons = QuickSort.partition(array, 0, array.length - 1)
      array.should == [1, 2]
      num_of_comparisons.should == 1
    end

    it "should correctly count total number of comparisons in small arrays" do
      array = [1, 2, 3, 4]
      num_of_comparisons = QuickSort.partition(array, 0, array.length - 1)
      array.should == [1, 2, 3, 4]
      num_of_comparisons.should == 6

    end


    it "should correctly count total number of comparisons in small arrays" do
      array = [4, 3, 2, 1]
      num_of_comparisons = QuickSort.partition(array, 0, array.length - 1)
      array.should == [1, 2, 3, 4]
      num_of_comparisons.should == 6
    end

    it "should correctly count total number of comparisons in small arrays" do
      array = [2, 1, 3, 10]
      num_of_comparisons = QuickSort.partition(array, 0, array.length - 1)
      array.should == [1, 2, 3, 10]
      num_of_comparisons.should == 4
    end


    it "should count total number of comparisons in file" do
      num = QuickSort.total_number_of_comparisons_in_sorting_from_file('../Sample_Data/QuickSort_SampleData.txt')

      num.should == 162085
      num.should == 164123
      num.should == 138382
    end
  end

end