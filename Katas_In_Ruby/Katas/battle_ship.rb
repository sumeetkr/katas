class BattleShip
  # To change this template use File | Settings | File Templates.
end

class Player
  attr_accessor :ships, :id

  def initialize(id, ships)
    @ships = ships
  end

  def shoot(x, y)
    msg = "miss"

    for ship in @ships
      if(ship.hit_count < ship.length)
        if(ship.start_x <= x && ship.end_x >= x) && (ship.start_y <= y && ship.end_y >= y)
          if (!ship.hit_locations.include?(x))
            ship.hit_locations << x
            ship.hit_count += 1
          end
          msg = "hit"
        end

        if (ship.hit_count == ship.length)
          msg = "you sunk my #{ship.name}"
          break;
        end
      end
    end

    if is_game_over
      msg = "game over"
    end

    return msg
  end

  def is_game_over()
    is_over = true

    for ship in @ships
      if(ship.hit_count != ship.length)
        is_over = false
        break
      end
    end

  end
end

class Ship
  attr_accessor :start_x, :start_y, :end_x, :end_y, :length, :name, :hit_count, :hit_locations

  def initialize(name, length)
    @length = length
    @name = name
    @start_x = 0
    @start_y = 0
    @end_x = @start_x + length
    @end_y = @start_y
    @hit_count = 0
    @hit_locations = []
  end
end
