require "spec_helper"
require "../Katas/water_in_bucket"

describe "WaterInBucket" do


  #Given n non-negative integers a1, a2, ..., an, where each represents a point at coordinate
  #(i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0).
  # Find two lines, which together with x-axis forms a container,
  #such that the container contains the most water.

  it "should do maximize the bucket size" do
    array = [2, 4, 6, 2, 6, 2, 2, 4]
    indices_array = WaterInBucket.get_bucket_with_max_water(array)

    indices_array[0].should == 0
    indices_array[1].should == 3
  end

  it "should do maximize the bucket size" do
    array = [2, 10, 6, 2, 6, 2, 2, 10, 3]
    indices_array = WaterInBucket.get_bucket_with_max_water(array)

    indices_array[0].should == 0
    indices_array[1].should == 3

  end

  it "should do maximize the bucket size" do
    array = [21, 4, 6, 2, 6, 2, 2, 2]
    indices_array = WaterInBucket.get_bucket_with_max_water(array)

    indices_array[0].should == 0
    indices_array[1].should == 4

  end
end