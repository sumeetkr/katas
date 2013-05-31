class RomanNumerals2
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
  #  Numbers like 4, 9, 40, 90, etc. are made with subtraction,
  #  writing a smaller number before the larger to represent subtracting.
  #  So the number 9 is IX - one less than 10.
  #
  #  You do this any time you would otherwise write four of a letter -
  #  so instead of writing 4 as "IIII" we write "IV".
  #  However 49 would NOT be IL because each place must be written independently: 40 + 9 ==> XLIX.
  #
  #  I   1
  #  V    5
  #  X    10
  #  L    50
  #  C    100
  #  D    500
  #  M    1000

  def initialize()
    @number_to_numerals_map = {}
    @number_to_numerals_map[1] = 'I'
    @number_to_numerals_map[4] = 'IV'
    @number_to_numerals_map[5] = 'V'
    @number_to_numerals_map[9] = 'IX'
    @number_to_numerals_map[10] = 'X'
    @number_to_numerals_map[50] = 'L'
    @number_to_numerals_map[100] = 'C'
    @number_to_numerals_map[500] = 'D'
    @number_to_numerals_map[1000] = 'M'

    @int_reps = [1000, 500, 100, 50, 10, 9, 5, 4, 1]

    @roman_numeral = ""

  end

  def convert_by_add(integer)
    if(integer == 0)
        return ""
    end

    index = get_index_of_largest_lower_number(integer)
    largest_lower_number = @int_reps[index]

    numeral = ""

    count = 1
    while(integer >= largest_lower_number * (count + 1))
      count += 1
    end

    numeral = @number_to_numerals_map[largest_lower_number] * count + convert_by_add(integer - count * largest_lower_number )
    #
    #if(count > 3)
    #  numeral = @number_to_numerals_map[@int_reps[index]] + @number_to_numerals_map[@int_reps[index -1]] + convert_by_add(integer - @int_reps[index -1] + @int_reps[index] )
    #else
    #  numeral = @number_to_numerals_map[largest_lower_number] * count + convert_by_add(integer - count * largest_lower_number )
    #end

    return numeral
  end

  def get_index_of_largest_lower_number(integer)
    index = @int_reps.length - 1
    int = @int_reps[index]

    while(integer >= @int_reps[index - 1] && (index - 1)>=0)
      index -= 1
    end

    return index
  end

  def parseRomanNumerals(roman_numeral)

  end

end