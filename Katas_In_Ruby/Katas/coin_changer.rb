class CoinChanger
  # To change this template use File | Settings | File Templates.
  attr_accessor :available_coin_denominations, :change_calculator

  def initialize(coin_denominations)
    @available_coin_denominations = coin_denominations
    @change_calculator = ChangeCalculator.new
  end

  def dispense_change(sum)
    coins_count = @change_calculator.calculate_coins_count(@available_coin_denominations, sum)
    return coins_count
  end
end

class ChangeCalculator

  def calculate_coins_count(available_coin_denominations, sum)
    coins_count_hash = Hash.new

    #initialize coins_count_hash with 0
    available_coin_denominations.each { |coin| coins_count_hash[coin] = 0 }

    current_sum = sum
    current_index = available_coin_denominations.length - 1

    while (current_index > 0 && current_sum > 0)
      coin_value = available_coin_denominations[current_index]
      if (current_sum >= coin_value)
        current_sum = current_sum - coin_value
        coins_count_hash[coin_value] += 1
      else
        current_index -= 1
      end
    end

    return coins_count_hash
  end
end