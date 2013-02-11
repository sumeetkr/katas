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

    max_element = ArrayProblems.get_max_element_of_unimodal_array(array)
    max_element.should == 8

  end

  it "should return the maximum element of unimodal array" do
    array = [2, 3, 4, 8, 6, 3, 1, -2, -6, -8, -9]

    max_element = ArrayProblems.get_max_element_of_unimodal_array(array)
    max_element.should == 8

  end

end