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
end