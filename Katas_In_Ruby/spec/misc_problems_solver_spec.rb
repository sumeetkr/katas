require "spec_helper"
require "../Katas/misc_problems_solver"

describe "My behaviour" do

  it "should do something" do

    #To change this template use File | Settings | File Templates.
    true.should == false
  end

  it "should convert the integer to bits" do
    integer_value = 11
    bit_value = MiscProblemsSolver.convert_int_to_bits(integer_value)
    bit_value =1011

  end

end