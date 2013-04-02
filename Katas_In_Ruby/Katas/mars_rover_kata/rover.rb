class Rover
  attr_accessor :x, :y, :direction, :grid

  def initialize(intial_x, intial_y, direction = Direction::N)
    @x = intial_x
    @y = intial_y
    @direction = direction
    @grid = Grid.new(100, 100)
  end

  def move(commands_string)
    commands_string.each do |command_string|
      break if execute_command(command_string) == false
    end
  end

  private;

  def execute_command(command_string)
    concrete_command = nil

    case command_string
      when "f"
        concrete_command = MoveForwardCommand.new(self, @grid)
      when "b"
        concrete_command = MoveBackwardCommand.new(self, @grid)
      when "l"
        concrete_command = TurnLeftCommand.new(self)
      when "r"
        concrete_command = TurnRightCommand.new(self)
      else

    end

    return concrete_command.execute()
  end
end