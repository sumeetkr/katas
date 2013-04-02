class TurnRightCommand
  def initialize(rover)
    @rover = rover
    #super(rover)
  end

  def execute
    case @rover.direction
      when Direction::N
        @rover.direction = Direction::E
      when Direction::E
        @rover.direction = Direction::S
      when Direction::S
        @rover.direction = Direction::W
      when Direction::W
        @rover.direction = Direction::N
    end
  end
end

