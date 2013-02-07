require "spec_helper"
require "../Katas/merge_sort"

describe "MergeSort" do

  it "merge_sorted_arrays should merge two sorted arrays" do

    left = [2, 5, 8, 9, 13]
    right = [1, 4, 6, 7]
    merged_array = MergeSort.merge_sorted_arrays(left, right)

    merged_array.should == [1, 2, 4, 5, 6, 7, 8, 9, 13]

  end

  it "should sort array" do
    array = [2, 1, 6, 4, 2, 9, 14, 3, 9, 0, -4]

    sorted_array = MergeSort.merge_sort(array)

    sorted_array.should == [-4, 0, 1, 2, 2, 3, 4, 6, 9, 9, 14]

  end
end