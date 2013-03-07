class FindLongestWordMadeOfOtherWords
  # Write a program that reads a file containing a sorted list of words (one
  #word per line, no spaces, all lower case), then identifies the longest
  #word in the file that can be constructed by concatenating copies of
  #shorter words also found in the file.
  attr_accessor :words_hash, :char_prime_values_dictionary

  def initialize
    @words_hash = Hash.new
    @char_prime_values_dictionary = Hash.new
    build_char_prime_values_dictionary()
  end

  def add_word(word)
    @words_hash[word]= get_prime_value_of_word(word)
  end

  def get_prime_value_of_word(word)
    prime_value_of_word = 1

    for char in word.split(//)
      prime_values_of_char = @char_prime_values_dictionary[char]
      prime_value_of_word *= prime_values_of_char
    end

    return prime_value_of_word
  end

  def can_existing_words_make_this_new_word(new_word)
    prime_value_of_word = get_prime_value_of_word(new_word)
    prime_value_of_word_original = prime_value_of_word

    for prime_value in @words_hash.values
      if (prime_value != prime_value_of_word_original)
        remainder = prime_value_of_word % prime_value

        if (remainder == 0)
          while (remainder == 0)
            prime_value_of_word = prime_value_of_word/prime_value
            remainder = prime_value_of_word % prime_value
          end
        end
      end
    end

    if (prime_value_of_word == 1)
      return true
    else
      return false
    end
  end

  def build_char_prime_values_dictionary
    prime_values_array = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127]

    i = 0
    for char in 'a'..'z'
      @char_prime_values_dictionary[char] = prime_values_array[i]
      i += 1
    end
  end
end