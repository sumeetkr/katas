require "rspec"

describe "MergeSort" do

  it "merge_sorted_arrays should merge two sorted arrays" do

    left = [2, 5, 8, 9]
    right = [1, 4, 6, 7]
    MergeSort.merge_sorted_arrays(left, right)

  end
end