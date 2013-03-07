require "spec_helper"
require "../Katas/find_longest_word_made_of_other_words"

describe "find longest word behaviour" do

  before() do
    @finder = FindLongestWordMadeOfOtherWords.new
  end

  subject { @finder }

  it { should.respond_to?(:words) }

  it "allows to insert words" do
    @finder.add_word("cat")
    @finder.words_hash.count.should == 1
  end

  it "builds a dictionary for each char having a associated prime value" do
    @finder.char_prime_values_dictionary['a'] = 2
    @finder.char_prime_values_dictionary['b'] = 3
    @finder.char_prime_values_dictionary['c'] = 5
  end

  it "assigns a prime number to each word" do
    @finder.add_word("cat")
    @finder.words_hash["cat"].should == 710
  end

  it "finds whether the word can be made of smaller existing words" do
    @finder.add_word("cat")

    can_be_made = @finder.can_existing_words_make_this_new_word("catdog")
    can_be_made.should == false

    @finder.add_word("dog")
    can_be_made = @finder.can_existing_words_make_this_new_word("catdog")
    can_be_made.should == true

    can_be_made = @finder.can_existing_words_make_this_new_word("catdogdog")
    can_be_made.should == true
  end

  it "should find the largest word made of other words" do
    words = ["cat", "cats", "catsdogcats", "catxdogcatsrat", "dog", "dogcatsdog", "hippopotamuses", "rat", "ratcatdogcat"].sort! { |x, y| y.length <=> x.length }

    for word in words
      @finder.add_word(word)
    end


    can_be_made = @finder.can_existing_words_make_this_new_word("ratcatdogcat")
    can_be_made.should == true

    hash = Hash.new
    for word in words
      hash[word] = @finder.can_existing_words_make_this_new_word(word)
    end

    max_word = hash.keys.max()

  end
end