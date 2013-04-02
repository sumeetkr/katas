A_LARGE_NEGATIVE_VALUE = -10000

class KnapSackProblemSolver
  attr_accessor :items, :items_hash

  def initialize(items)
    @items = items
    @items_hash = Hash.new

    for i in 1..items.height
      @items_hash[i] = @items[i-1]
    end
  end

  def solve_using_brute_force(max_weight)

    value = get_value_that_maximizes_total_value(@items_hash.length, max_weight)
    return value
  end

  def solve_iteratively(max_weight)
    max_value = 0;
    value = 0;
    for i in 1..@items.height
      for weight in 0..max_weight
        value = get_value_that_maximizes_total_value(i, weight)

        max_value = value if value > max_value
      end
    end

    return max_value;
  end

  private;

  #ToDo: need to add memoization
  def get_value_that_maximizes_total_value(i, weight)

    #base case
    if(weight < 0)
      return A_LARGE_NEGATIVE_VALUE #a big value
    end
    if (i == 0)
      return 0
    end

    value_if_weight_is_not_included = get_value_that_maximizes_total_value(i - 1, weight)
    value_if_weight_is_included = @items_hash[i].value + get_value_that_maximizes_total_value(i - 1, weight - @items_hash[i].weight)

    return value_if_weight_is_included > value_if_weight_is_not_included ? value_if_weight_is_included : value_if_weight_is_not_included
  end
end

class Sack
  attr_accessor :capacity, :items, :total_value

  def initialize(capacity)
    @capacity = capacity
    @total_value = 0
    @items = []
  end
end

class Item
  attr_accessor :value, :weight

  def initialize(value, weight)
    @value = value
    @weight = weight
  end
end