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
    @rover = Rover.new(@grid, 0, 0)
  end

end

class Rover
  attr_accessor :direction, :x, :y
  @grid

  def initialize(grid, x = 0, y = 0, direction = Direction::E)
    @direction = direction
    @grid = grid
    @x = x
    @y = y
  end

  def move(motion_direction)
    if (motion_direction == MotionDirection::L || motion_direction == MotionDirection::R)
      turn(motion_direction)
    else
      case motion_direction
        when (MotionDirection::F && @direction == Direction::N) || (MotionDirection::B && @direction == Direction::S)
          change_location(0, 1)
        when (MotionDirection::F && @direction == Direction::S) || (MotionDirection::B && @direction == Direction::N)
          change_location(0, -1)
        when (MotionDirection::F && @direction == Direction::E) || (MotionDirection::B && @direction == Direction::W)
          change_location(1, 0)
        when (MotionDirection::F && @direction == Direction::W) || (MotionDirection::B && @direction == Direction::E)
          change_location(-1, 0)
      end
    end
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

  def change_location(x_change, y_change)
    if(@x + x_change > @grid.grid_width)
      new_x = (@x + x_change) % @grid.grid_width
    else
      new_x = @x + x_change
    end

    if(@y + y_change > @grid.grid_height)
      new_y = (@y + y_change) % @grid.grid_height
    else
      new_y = @y + y_change
    end

    if(is_cell_free(new_x, new_y))
      @x = new_x
      @y = new_y
    else
      puts("next cell in blocked")
    end
  end

  def is_cell_free(x, y)
    @grid.is_cell_free(x,y)
  end
end

class Grid
  attr_accessor :cell_array, :grid_height, :grid_width

  def initialize(size)
    @grid_height = size
    @grid_width = size

    @cell_array = Array.new(grid_height) { Array.new(grid_width) }

    for i in 0..(size - 1)
      for j in 0..(size - 1)
        @cell_array[i][j] = Cell.new(i, j)
      end
    end
  end

  def is_cell_free(x, y)
    cell = (@cell_array[x - 1])[y - 1]
    return cell.is_free
  end
end

class Cell
  attr_accessor :x_location, :y_location, :is_free

  def initialize(x, y, is_free = true)
    @x_location = x
    @y_location = y
    @is_free = is_free
  end
end