class TurnLeftCommand
  def initialize(rover)
    @rover = rover
    #super(rover)
  end

  def execute
    case @rover.direction
      when Direction::N
        @rover.direction = Direction::W
      when Direction::E
        @rover.direction = Direction::N
      when Direction::S
        @rover.direction = Direction::E
      when Direction::W
        @rover.direction = Direction::S
    end
  end
end
