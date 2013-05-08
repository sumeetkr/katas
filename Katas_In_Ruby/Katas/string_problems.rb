class StringProblems
  # To change this template use File | Settings | File Templates.
  def self.reverse_words(line)
    chars = line.split(//)

    reverse_chars = []

    i = 0
    while i < chars.length
      reverse_chars<< chars[chars.length - i -1]
      i +=1
    end

    #reverse single words
    j = 0
    k = 0
    while j <= reverse_chars.length

      if (reverse_chars[j] ==" " || j == reverse_chars.length)
        m = k
        n = j

        while m < (k+j)/2
          chr = reverse_chars[n-1]
          reverse_chars[n-1] = reverse_chars[m]
          reverse_chars[m] = chr

          m += 1
          n -= 1
        end

        k= j+1
      end

      j += 1
    end

    return reverse_chars.join
  end

  def self.get_min_window(complete_string, sub_string)
    array_of_string = complete_string.split(//)
    array_of_substring = sub_string.split(//)

    i = 0
    while i < array_of_string.length
      if (array_of_string[i]== "A")
        array_of_string[i] == 3
        if (array_of_string[i]== "B")
          array_of_string[i] == 5
        else
          array_of_string[i] == 0
        end
      end
    end

    return array_of_string.join
  end

  def self.is_match_contained_in_string(input_string, match)

    window = input_string.sub(match.length)


    input_string.split('').while do |char|

    end

  end

  def self.find_palindromes(input_string)

    longest_palindrome_length = 0
    current_palindrome_length = 0

    # check odd palindromes
    for index in 0..(input_string.length - 1)
      current_palindrome_length = self.is_odd_palindrome(input_string, index )
      longest_palindrome_length =   current_palindrome_length if current_palindrome_length>longest_palindrome_length
    end

    return longest_palindrome_length
  end

  def self.is_odd_palindrome(input_string, index)
    palindrome_length = 0

    distance = 0
    while index + distance < input_string.length && index - distance > -1
      if (input_string[index + distance] != input_string[index - distance])
        break
      end
      distance += 1
    end

    return distance* 2 - 1
  end

  def self.get_permutations(input_string)
    permutations = []
    permutations << input_string

    for index in 0..(input_string.length - 1)
       self.swap_with_other_chars(input_string, index, permutations)
    end

    return permutations
  end

  def self.swap_with_other_chars(input_string, location, permutations)

    for index in location..(input_string.length -1)
      new_string = input_string.copy
      permutations << new_string
    end
  end
end