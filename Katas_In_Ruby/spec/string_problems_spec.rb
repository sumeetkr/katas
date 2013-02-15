require "spec_helper"
require "../Katas/string_problems"

describe "My behaviour" do

  it "should reverse the words" do
    web_page = "my webpage is sumeetkumar.in"
    result = StringProblems.reverse_words(web_page)

    result.should == "sumeetkumar.in is webpage my"

  end

  it "should reverse the words" do
    web_page = "who are you."
    result = StringProblems.reverse_words(web_page)

    result.should == "you. are who"

  end

  it "should reverse the words" do
    web_page = "I am Sam"
    result = StringProblems.reverse_words(web_page)

    result.should == "Sam am I"

  end
end