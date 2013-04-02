class MarsRoverGame
  attr_reader :grid, :rover
  def initialize(grid_width, grid_height)
    @grid = Grid.new(grid_width, grid_height)
    @rover = Rover.new(0, 0)
  end

  def move_rover(command_strings)

  end
end