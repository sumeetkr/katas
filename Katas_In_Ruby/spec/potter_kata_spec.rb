require "spec_helper"
require "../Katas/potter_kata"

describe "My behaviour" do

#Problem Description
#Once upon a time there was a series of 5 books about a very English hero called Harry.
# (At least when this Kata was invented, there were only 5. Since then they have multiplied)
#Children all over the world thought he was fantastic, and, of course, so did the publisher.
#So in a gesture of immense generosity to mankind, (and to increase sales) they set up the following
#pricing model to take advantage of Harry's magical powers.
#
#One copy of any of the five books costs 8 EUR. If, however, you buy two different books from the series,
#you get a 5% discount on those two books. If you buy 3 different books, you get a 10% discount.
#With 4 different books, you get a 20% discount. If you go the whole hog, and buy all 5,
# you get a huge 25% discount.
#
#Note that if you buy, say, four books, of which 3 are different titles, you get a 10% discount
#on the 3 that form part of a set, but the fourth book still costs 8 EUR.
#
#Potter mania is sweeping the country and parents of teenagers everywhere are queueing up with
# shopping baskets overflowing with Potter books. Your mission is to write a piece of code to
# calculate the price of any conceivable shopping basket, giving as big a discount as possible.
#
#For example, how much does this basket of books cost?
#
#  2 copies of the first book
#  2 copies of the second book
#  2 copies of the third book
#  1 copy of the fourth book
#  1 copy of the fifth book
#(answer: 51.20 EUR)
#

  context "when a set of books each having equal number of copies is purchased" do

    it "should calculate correct price for 5*2 book " do
      price = PotterKata.calculate_price(2, 2, 2, 2, 2)
      price.should == 16*5*0.75
    end
  end

  context "when a set of books each having no more than one copy is purchased" do

    it "should calculate correct price for 1 book " do
      price = PotterKata.calculate_price(0, 0, 0, 0, 1)
      price.should == 8*1
    end

    it "should calculate correct price for 2 books " do
      price = PotterKata.calculate_price(1, 0, 0, 0, 1)
      price.should == 8*2*0.95
    end

    it "should calculate correct price for 3 books " do
      price = PotterKata.calculate_price(1, 1, 0, 0, 1)
      price.should == 8*3*0.9
    end

    it "should calculate correct price for 4 books " do
      price = PotterKata.calculate_price(1, 1, 1, 0, 1)
      price.should == 8*4*0.8
    end

    it "should calculate correct price for 5 books " do
      price = PotterKata.calculate_price(1, 1, 1, 1, 1)
      price.should == 8*5*0.75
    end

  end

  context "when a set of books each having equal number of copies is purchased" do

    it "should calculate correct price for 5*2 book " do
      price = PotterKata.calculate_price(2, 2, 2, 2, 2)
      price.should == 16*5*0.75
    end
  end

  context "when a set of books each having a different number of copies is purchased" do

    it "should calculate correct price for books " do
      price = PotterKata.calculate_price(5, 4, 3, 2, 1)
      price.should == 5*8*0.75 + 4*8*0.8 + 3*8*0.9 + 2*8*0.95 + 1*8
    end
  end

  context "when a set of books each having some number of copies is purchased" do

    it "should calculate correct price for books " do
      price = PotterKata.calculate_price(1, 3, 1, 4, 2)
      price.should == 8*5*0.75 + 8*3*0.9 + 2*8*0.95 + 1*8
    end

    it "should calculate correct price for books " do
      price = PotterKata.calculate_price(2, 2, 2, 1, 1)
      price.should == 51.20
    end
  end

  context "test edge cases" do
    it "should successfully test edge cases" do
      PotterKata.price([0, 0, 1, 1, 2, 2, 3, 4]).should equal (2 * (8 * 4 * 0.8))
      PotterKata.price([0, 0, 0, 0, 0,
                        1, 1, 1, 1, 1,
                        2, 2, 2, 2,
                        3, 3, 3, 3, 3,
                        4, 4, 4, 4]).should equal (3 * (8 * 5 * 0.75) + 2 * (8 * 4 * 0.8))

    end

  end
end