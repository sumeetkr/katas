require "spec_helper"
require "../Katas/inversions_in_array"

describe "InversionsInArray" do

  it "should find 1 inversion" do

    array = [1, 3, 4, 6, 5, 8]
    InversionsInArray.count_inversions(array).should == 1
  end

  it "should find 2 inversions" do

    array = [1, 3, 4, 6, 5, 8, 7]
    InversionsInArray.count_inversions(array).should == 2
  end

  it "should count 4 inversions" do

    array = [1, 3, 4, 6, 2, 5, 8]
    InversionsInArray.count_inversions(array).should == 4
  end

  it "should count 11 inversions" do

    array = [1, 3, 4, 6, 2, 5, 8, 0]
    InversionsInArray.count_inversions(array).should == 11
  end

end