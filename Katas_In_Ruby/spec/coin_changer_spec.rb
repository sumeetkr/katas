require "spec_helper"
require "../Katas/coin_changer.rb"

describe "coin changer" do

#You've just created a virtual vending machine that will dispense widgets of programming goodness
#when a user puts money into the machine. The machine should dispense the proper change.
#You now need the programming logic to determine which coins to dispense.

#Write a program that will correctly determine the least number of coins to be given to the user
#such that the sum of the coins' value would equal the correct amount of change.

#Input: change amount
#Input: coin denomination array (ie [1, 5, 10, 25, 100] )
#Output: number of coins array (ie [1, 0, 1, 0, 0] would represent $0.11
#
#For example
#An input of 15 with [1, 5, 10, 25, 100] should return fifteen cents or [0, 1, 1, 0, 0]
#An input of 40 with [1, 5, 10, 25, 100] should return two dimes or [0, 1, 1, 1, 0]


  before(:each) do
    coin_denominations = [1, 5, 10, 25, 100]
    @coin_changer = CoinChanger.new(coin_denominations)

  end

  it "should respond to " do
    @coin_changer.should respond_to(:available_coin_denominations)
    @coin_changer.should respond_to(:change_calculator)
    @coin_changer.should respond_to(:dispense_change)
  end

end

describe "ChangeCalculator" do

  before(:each) do
    @calculator = ChangeCalculator.new
  end

  it "should respond to" do
    @calculator.should respond_to(:calculate_coins_count)
  end

  it "should calculate the correct sum " do
    #An input of 15 with [1, 5, 10, 25, 100] should return fifteen cents or [0, 1, 1, 0, 0]
    coin_denominations = [1, 5, 10, 25, 100]
    coins_returned = @calculator.calculate_coins_count(coin_denominations, 15)
    coins_returned[10].should == 1
    coins_returned[5].should == 1
  end

  it "should calculate the optimized sum " do
    #An input of 40 with [1, 5, 10, 25, 100] should return two dimes or [0, 1, 1, 1, 0]
    coin_denominations = [1, 5, 10, 25, 100]
    coins_returned = @calculator.calculate_coins_count(coin_denominations, 40)
    coins_returned[10].should == 1
    coins_returned[5].should == 1
    coins_returned[25].should == 1
  end

  it "should work in boundary case - 1 " do
    #An input of 0 with [1, 5, 10, 25, 100] should return  [0, 0, 0, 0, 0]
    coin_denominations = [1, 5, 10, 25, 100]
    coins_returned = @calculator.calculate_coins_count(coin_denominations, 0)
    coins_returned[5].should == 0
  end

  it "should work in boundary case - 2 " do
    #An input of 1000 with [1, 5, 10, 25, 100] should return [0, 0, 0, 0, 10]
    coin_denominations = [1, 5, 10, 25, 100]
    coins_returned = @calculator.calculate_coins_count(coin_denominations, 1000)
    coins_returned[100].should == 10
  end


  it "should work in boundary case - 3 " do
    #An input of 20 with [1, 5, 10, 25, 100] should return [0, 0, 2, 0, 10]
    coin_denominations = [1, 5, 10, 25, 100]
    coins_returned = @calculator.calculate_coins_count(coin_denominations, 20)
    coins_returned[10].should == 2
  end

  it "should work in boundary case - 4 " do
    #An input of 5 with [2, 4, 8] should return [0, 1, 0]
    coin_denominations = [2, 4, 8]
    coins_returned = @calculator.calculate_coins_count(coin_denominations, 5)
    coins_returned[4].should == 1
  end

end