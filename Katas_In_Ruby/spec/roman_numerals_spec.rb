require "rspec"
require "../Katas/roman_numerals2"

describe "ROMAN NUMERALS Converter behaviour" do

#  ROMAN NUMERALS
#
#Write algorithms to:
#Convert an integer to roman numerals and return as a string
#String toRomanNumerals(int number);
#
#Parse the String of roman numerals and return an integer
#  int parseRomanNumerals(String roman);
#
#
#  Background
#
#  Roman numerals are a numeric system from ancient Rome that uses combinations of letters to represent values.
#  The numbers 1 through 10 written in roman numerals are as follows: I, II, III, IV, V, VI, VII, VIII, IX, X
#
#  Roman numerals use letters to represent different values.
#  These letters are combined to make larger numbers.
#  The simplest numbers are made by addition, writing numbers largest to smallest,
#  so the number 17 would be XVII - an X (10), V (5) and two I's (1's).
#
#Numbers like 4, 9, 40, 90, etc. are made with subtraction,
#writing a smaller number before the larger to represent subtracting.
#So the number 9 is IX - one less than 10.
#
#You do this any time you would otherwise write four of a letter -
#so instead of writing 4 as "IIII" we write "IV".
#However 49 would NOT be IL because each place must be written independently: 40 + 9 ==> XLIX.
#
#  I   1
#  V    5
#  X    10
#  L    50
#  C    100
#  D    500
#  M    1000
#
#  The symbols "I", "X", "C", and "M" can be repeated three times in succession, but no more.
#  I, II, III, IV, V, VI, VII, VIII, IX, X
#  XI, XII, XIII, XIV, XV, XVI, XVII, XVIII, XIX, XX

  before()do
    @roman_converter = RomanNumerals2.new()
  end

  #context "hash " do
  #  it "should contain basic conversions from number to roman " do
  #    @roman_converter[1] = :I
  #  end
  #end

  context " convert by adding" do
    it "should get me number by addition" do
      val =  @roman_converter.convert_by_add(1)
      val.should == 'I'
    end

    it "should get me number by addition" do
      val =  @roman_converter.convert_by_add(3)
      val.should == 'III'
    end

    it "should get me number by addition" do
      val =  @roman_converter.convert_by_add(4)
      val.should == 'IV'
    end

    it "should get me number by addition" do
      val =  @roman_converter.convert_by_add(6)
      val.should == 'VI'
    end

    it "should get me number by addition" do
      val =  @roman_converter.convert_by_add(8)
      val.should == 'VIII'
    end

    it "should get me number by addition" do
      val =  @roman_converter.convert_by_add(9)
      val.should == 'IX'
    end

    it "should get me number by addition" do
      val =  @roman_converter.convert_by_add(18)
      val.should == 'XVIII'
    end

    it "should get me number by addition" do
      val =  @roman_converter.convert_by_add(49)
      val.should == 'XLIX'
    end
  end

  #context " convert by substracting" do
  #  it "should get me number by subs" do
  #      val =  @roman_converter.convert_by_subs(4)
  #      val.should == 'IV'
  #  end
  #
  #  it "should get me number by subs" do
  #    val =  @roman_converter.convert_by_subs(9)
  #    val.should == 'IX'
  #  end
  #end

  #context "complex conversions" do
  #  it "should get me number" do
  #    val =  @roman_converter.convert(21)
  #    val.should == 'XXI'
  #  end
  #
  #  it "should get me number" do
  #    val =  @roman_converter.convert(14)
  #    val.should == 'XIV'
  #  end
  #
  #  it "should get me number by subs" do
  #    val =  @roman_converter.convert(19)
  #    val.should == 'XIX'
  #  end
  #
  #  it "should get me number by subs" do
  #    val =  @roman_converter.convert(41)
  #    val.should == 'XXXXI'
  #  end
  #end
end