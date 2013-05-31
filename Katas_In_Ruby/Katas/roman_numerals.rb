class RomanNumerals

  @converions_hash
  @int_reps

  def initialize()

    #  I   1
    #  V    5
    #  X    10
    #  L    50
    #  C    100
    #  D    500
    #  M    1000
    @converions_hash = {}
    @converions_hash[1] = 'I'
    @converions_hash[5] = 'V'
    @converions_hash[10] = 'X'
    @converions_hash[50] = 'L'
    @converions_hash[100] = 'C'
    @converions_hash[500] = 'D'
    @converions_hash[1000] = 'M'

    @int_reps = [1000, 500, 100, 50, 10, 5, 1]

  end

  def convert(i)
    final_char=''

    if (i == 0)
      return ''
    end

    if (i == 9)
      return 'IX'
    end

    if (i == 4)
      return 'IV'
    end

    index_reverse =0
    for index_reverse in 0..(@int_reps.length - 1)
      if (i >= @int_reps[index_reverse])
        break
      end
    end

      int = @int_reps[index_reverse]
      roman_char = @converions_hash[int]

      number_of_time = i/@int_reps[index_reverse]

      if (number_of_time > 3)
        final_char<< @converions_hash[int] + @converions_hash[@int_reps[index_reverse -1]]
      else
        (1..number_of_time).each do
          final_char << roman_char
        end
      end


    i = i - @int_reps[index_reverse]
    final_char << convert(i)

    #for  index_reverse in 0..(@int_reps.length - 1)
    #
    #  if(2*i > @int_reps[index_reverse])
    #    int = @int_reps[index_reverse]
    #    roman_char =   @converions_hash[int]
    #    final_char = convert_by_add(int - i) + roman_char
    #    next
    #  end
    #
    #  if(i >= @int_reps[index_reverse])
    #
    #    int = @int_reps[index_reverse]
    #    roman_char =   @converions_hash[int]
    #
    #    number_of_time = i/@int_reps[index_reverse]
    #
    #    #if(number_of_time > 3)
    #    #  final_char<< convert_by_subs(i)
    #    #else
    #      (1..number_of_time).each do
    #        final_char << roman_char
    #        i = i - @int_reps[index_reverse]
    #      end
    #    #end
    #  end
    #end

    return final_char
  end

  def convert_by_add(i)

    final_char=''

    for index_reverse in 0..(@int_reps.length - 1)
      if (i >= @int_reps[index_reverse])

        int = @int_reps[index_reverse]
        roman_char = @converions_hash[int]

        number_of_time = i/@int_reps[index_reverse]

        if(i == 2*int -1 )
          final_char << convert_by_subs(i)
          break
        end

        if(number_of_time>3)
          final_char<< @converions_hash[@int_reps[index_reverse]]
          final_char<< @converions_hash[@int_reps[index_reverse -1]]
          i = i - @int_reps[index_reverse]
        else
          (1..number_of_time).each do
            final_char<< roman_char
            i = i - @int_reps[index_reverse]
          end
        end
      end
    end

    return final_char

  end


  def convert_by_subs(i)

    final_char=''
    int = 0

    for index_reverse in 0..(@int_reps.length - 1)
      if (2*i > @int_reps[index_reverse])
        int = @int_reps[index_reverse]
        roman_char = @converions_hash[int]
        break
      end
    end

    final_char = convert_by_add(int - i) + roman_char
    return final_char
  end

end