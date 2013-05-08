require "spec_helper"
require "../Katas/bit_manipulation"

describe "My behaviour" do

  it" should find palindrome" do

  end

  it "should get the number of bits to be flipped" do
    # Given two unsigned integers, write an efficient function which returns
    # the no. of bits needs to be flipped of one to generate the other.
    a = 12345
    b = 23456

    count = BitManipulation.get_number_of_bits_to_be_flipped(a,b)

    count.should == 9
  end

#swap every two bits in an unsigned char .. eg swap bits at 0 and 1st position,
#swap 2nd and 3rd position, swap 4th and 5th position etc ..

#Calculate number of zeros in a given integer.
#Write a function to convert an IPv4 Address in string format to an unsigned integer
end