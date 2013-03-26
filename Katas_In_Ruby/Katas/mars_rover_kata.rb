module Direction
  N = 1
  E = 2
  S = 3
  W = 4
end

module MotionDirection
  F = 1
  B = 2
  L = 3
  R = 4

end

class MarsRoverGame
  attr_accessor :rover, :grid

  def initialize
    @grid = Grid.new(10)
    @rover = Rover.new(0, 0)
  end

  def move(motion_direction)
    if (motion_direction == MotionDirection::L || motion_direction == MotionDirection::R)
      @rover.turn(motion_direction)
    else
      case motion_direction
        when (MotionDirection::F && @rover.direction == Direction::N) || (MotionDirection::B && @rover.direction == Direction::S)
          @rover.move(0, 1)
        when (MotionDirection::F && @rover.direction == Direction::S) || (MotionDirection::B && @rover.direction == Direction::N)
          @rover.move(0, -1)
        when (MotionDirection::F && @rover.direction == Direction::E) || (MotionDirection::B && @rover.direction == Direction::W)
          @rover.move(1, 0)
        when (MotionDirection::F && @rover.direction == Direction::W) || (MotionDirection::B && @rover.direction == Direction::E)
          @rover.move(-1, 0)
      end
    end
  end

end

class Rover
  attr_accessor :direction, :x, :y

  def initialize(x, y)
    @direction = Direction::E
    @x = x
    @y = y
  end

  def turn(turn_direction)
    case turn_direction
      when MotionDirection::L
        @direction = @direction - 1
        if (@direction < 1)
          @direction = 4
        end
      when MotionDirection::R
        @direction = @direction + 1
        if (@direction > 4)
          @direction = 0
        end
    end
  end

  def move(x_change, y_change)
    @x += x_change
    @y += y_change
  end
end

class Grid
  attr_accessor :cell_array

  def initialize(size)
    grid_height = size
    grid_width = size

    @cell_array = Array.new(grid_height) { Array.new(grid_width) }

    for i in 0..(size - 1)
      for j in 0..(size - 1)
        @cell_array[i][j] = Cell.new(i, j)
      end
    end

    @cell_array
  end

end

class Cell
  attr_accessor :x_location, :y_location, :is_free

  def initialize(x, y)
    @x_location = x
    @y_location = y
    @is_free = true
  end

end