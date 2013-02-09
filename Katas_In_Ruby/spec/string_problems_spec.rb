require "spec_helper"
require "../Katas/string_problems"

describe "My behaviour" do

  it "should reverse the words" do
    web_page = "my webpage is sumeetkumar.in"
    result = StringProblems.reverse_words(web_page)

    result.should == "sumeetkumar.in is webpage my"

  end
end