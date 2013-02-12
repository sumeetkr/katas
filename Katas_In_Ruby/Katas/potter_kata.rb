class PotterKata
  #Problem Description
  #Once upon a time there was a series of 5 books about a very English hero called Harry.
  # (At least when this Kata was invented, there were only 5. Since then they have multiplied)
  #Children all over the world thought he was fantastic, and, of course, so did the publisher.
  #So in a gesture of immense generosity to mankind, (and to increase sales) they set up the following
  #pricing model to take advantage of Harry's magical powers.
  #
  #One copy of any of the five books costs 8 EUR. If, however, you buy two different books from the series,
  #you get a 5% discount on those two books. If you buy 3 different books, you get a 10% discount.
  #With 4 different books, you get a 20% discount. If you go the whole hog, and buy all 5,
  # you get a huge 25% discount.
  #
  #Note that if you buy, say, four books, of which 3 are different titles, you get a 10% discount
  #on the 3 that form part of a set, but the fourth book still costs 8 EUR.
  #
  #Potter mania is sweeping the country and parents of teenagers everywhere are queueing up with
  # shopping baskets overflowing with Potter books. Your mission is to write a piece of code to
  # calculate the price of any conceivable shopping basket, giving as big a discount as possible.
  #
  #For example, how much does this basket of books cost?
  #
  #  2 copies of the first book
  #  2 copies of the second book
  #  2 copies of the third book
  #  1 copy of the fourth book
  #  1 copy of the fifth book
  #(answer: 51.20 EUR)

  PRICE_OF_ONE_BOOK = 8

  def self.calculate_price(first_book_count,
      second_book_count,
      third_book_count,
      fourth_book_count,
      fifth_book_count)

    @book_cart = BookCart.new(first_book_count,
                              second_book_count,
                              third_book_count,
                              fourth_book_count,
                              fifth_book_count)

    book_sets_count = get_count_of_sets_of_books(@book_cart)
    price = (book_sets_count[0] +
        book_sets_count[1] *2* 0.95+
        book_sets_count[2] *3* 0.9+
        book_sets_count[3] *4* 0.8+
        book_sets_count[4] *5* 0.75
    ) * PRICE_OF_ONE_BOOK


    return price
  end

  #this method was added to test the test cases posted on craftmanship website
  def self.price(array_of_books)
    first_book_count, second_book_count, third_book_count, fourth_book_count, fifth_book_count = 0

    array_of_grouped_books= [0, 0, 0, 0, 0]
    for i in array_of_books
      array_of_grouped_books[i] +=1
    end

    @book_cart = BookCart.new(array_of_grouped_books[0],
                              array_of_grouped_books[1],
                              array_of_grouped_books[2],
                              array_of_grouped_books[3],
                              array_of_grouped_books[4])

    book_sets_count = get_count_of_sets_of_books(@book_cart)
    price = (book_sets_count[0] +
        book_sets_count[1] *2* 0.95+
        book_sets_count[2] *3* 0.9+
        book_sets_count[3] *4* 0.8+
        book_sets_count[4] *5* 0.75
    ) * PRICE_OF_ONE_BOOK


    return price
  end

  private;

  def self.get_count_of_sets_of_books(book_cart)

    set_of_books = [0, 0, 0, 0, 0] #set_of_one_count, set_of_two_count, set_of_three_count, set_of_four_count, set_of_five_count

    while book_cart.first_book_count > 0 || book_cart.second_book_count > 0 || book_cart.third_book_count > 0 || book_cart.fourth_book_count > 0 || book_cart.fifth_book_count > 0

      if (book_cart.get_books_count == 5)
        set_of_books[4] += 1
      end

      if (book_cart.get_books_count == 4)
        set_of_books[3] +=1
      end

      if (book_cart.get_books_count == 3)
        set_of_books[2] +=1
      end

      if (book_cart.get_books_count == 2)
        set_of_books[1] +=1
      end

      if (book_cart.get_books_count == 1)
        set_of_books[0] +=1
      end


      book_cart.first_book_count -= 1
      book_cart.second_book_count -= 1
      book_cart.third_book_count -= 1
      book_cart.fourth_book_count -= 1
      book_cart.fifth_book_count -= 1
    end

    return set_of_books

  end

end

class BookCart
  attr_accessor :first_book_count,
                :second_book_count,
                :third_book_count,
                :fourth_book_count,
                :fifth_book_count

  def initialize(first_book_count,
      second_book_count,
      third_book_count,
      fourth_book_count,
      fifth_book_count)

    @first_book_count = first_book_count
    @second_book_count = second_book_count
    @third_book_count = third_book_count
    @fourth_book_count = fourth_book_count
    @fifth_book_count = fifth_book_count
  end

  def get_books_count
    count = 0;
    if (@first_book_count > 0)
      count +=1
    end

    if (@second_book_count > 0)
      count +=1
    end

    if (@third_book_count > 0)
      count +=1
    end

    if (@fourth_book_count > 0)
      count +=1
    end

    if (@fifth_book_count > 0)
      count +=1
    end

    return count
  end
end