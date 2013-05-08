class BitManipulation
  # To change this template use File | Settings | File Templates.
  def self.is_palindrome(input_integer)
    temp = input_integer

  end

  def self.get_number_of_bits_to_be_flipped(a, b)
    a_in_bits = a.to_s(2)
    b_in_bits = b.to_s(2)

    flip_count = 0
    for index in 0..(a_in_bits.length - 1)
      if (index < b_in_bits.length && a_in_bits[index] != b_in_bits[index])
        flip_count += 1
      end
      index += 1
    end

    return flip_count
  end
end