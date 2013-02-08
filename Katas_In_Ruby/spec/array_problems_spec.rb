require "spec_helper"
require "../Katas/array_sorters"

describe "My behaviour" do

  it "should return closest indices to sort" do
    array = [1, 3, 5, 4, 3, 8, 9]
    indices_array = get_closest_indices_to_sort(array)
    indices_array[0].should == 2
    indices_array[1].should == 4
  end
end