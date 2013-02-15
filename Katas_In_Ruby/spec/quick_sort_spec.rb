require "spec_helper"
require "../Katas/quick_sort"

describe "QuickSort behaviour" do

  it "should sort array" do
    array = [2, 1, 6, 4, 2, 9, 14, 3, 9, 0, -4]

    sorted_array = QuickSort.sort(array)

    sorted_array.should == [-4, 0, 1, 2, 2, 3, 4, 6, 9, 9, 14]

  end
end