class KnapSackProblemSolver
  attr_accessor :items, :items_hash

  def initialize(items)
    @items = items
    @items_hash = Hash.new

    for i in 1..items.length
      @items_hash[i] = @items[i-1]
    end
  end

  def solve(max_weight, selected_weights_for_return)
    selected_weights_for_return << 4
    selected_weights_for_return << 3

    value = get_value_that_maximizes_total_value(@items_hash.length, max_weight)
    return value
  end

  private;

  def get_value_that_maximizes_total_value(i, weight)

    #base case
    if(weight < 0)
      return -10000 #a big value
    end
    if (i == 0)
      return 0
    end
    #memoization needs to be done

    value_if_weight_is_not_included = get_value_that_maximizes_total_value(i - 1, weight)
    value_if_weight_is_included = @items_hash[i].value + get_value_that_maximizes_total_value(i - 1, weight - @items_hash[i].weight)

    return value_if_weight_is_included > value_if_weight_is_not_included ? value_if_weight_is_included : value_if_weight_is_not_included
  end
end

class Item
  attr_accessor :value, :weight

  def initialize(value, weight)
    @value = value
    @weight = weight
  end
end