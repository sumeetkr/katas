class MoveBackwardCommand
  #< MarsRoverKata::Command

  def initialize(rover, grid)
    @rover = rover
    @grid = grid
    #super(rover)
  end

  def execute
    case @rover.direction
      when Direction::N
        @rover.y = @grid.last_y(@rover.x, @rover.y)
      when Direction::E
        @rover.x = @grid.last_x(@rover.x, @rover.y)
      when Direction::S
        @rover.y = @grid.next_y(@rover.x, @rover.y)
      when Direction::W
        @rover.x = @grid.next_x(@rover.x, @rover.y)
    end
  end
end