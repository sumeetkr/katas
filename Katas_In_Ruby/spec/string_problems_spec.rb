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

  #context "minimum window substring " do
  #  #  Given a string S and a string T, find the minimum window in S which will contain all the characters in
  #  #T in complexity O(n). For example:
  #  #  S = "ADOBECODEBANC"      T = "ABC"
  #  #  Minimum window is "BANC".
  #  #
  #  #  Note:
  #  #  If there is no such window in S that covers all characters in T, return the empty string "".
  #  #
  #  #  If there are multiple such windows, you are guaranteed that there will always be only one unique
  #  # minimum window in S.
  #
  #  s = "ADOBECODEBANC"
  #  t = "ABC"
  #
  #  min_window = StringProblems.get_min_window(s, t)
  #  min_window == "BANC"
  #
  #end

  context "permutations of string" do
  # Given a string, find whether it has any permutation of another string.
  # For example, given "abcdefg" and "ba", it shuold return true, because "abcdefg" has
  # substring "ab", which is a permutation of "ba".

    it "should find a match" do
      input_string = "abcdefgkmn"
      match = "fde"

      is_match_found = StringProblems.is_match_contained_in_string(input_string, match)

    end

    it "should find permutations of a string" do
      input_string = "abc"
      permutations = StringProblems.get_permutations(input_string)
      permutations.length.should == 6
    end

    it "should find the longest palindrome in a string" do
      input_string = "abcdefgkmnnmkabcba"
      palindromes = StringProblems.find_palindromes(input_string)
      palindromes.length.should == 2
    end
  end
end