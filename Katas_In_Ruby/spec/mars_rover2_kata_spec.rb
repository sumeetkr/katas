require "spec_helper"
require "../Katas/mars_rover_kata/direction"
require "../Katas/mars_rover_kata/rover"
require "../Katas/mars_rover_kata/grid"
require "../Katas/mars_rover_kata/move_forward_command"
require "../Katas/mars_rover_kata/move_backward_command"
require "../Katas/mars_rover_kata/turn_left_command"
require "../Katas/mars_rover_kata/turn_right_command"
require "../Katas/mars_rover_kata/mars_rover_game"

describe "MarsRover behaviour" do

# Develop an api that moves a rover around on a grid.
# You are given the initial starting point (x,y) of a rover and the direction (N,S,E,W) it is facing.
#
# The rover receives a character array of commands.
#
# Implement commands that move the rover forward/backward (f,b).
# Implement commands that turn the rover left/right (l,r).
# Implement wrapping from one edge of the grid to another. (planets are spheres after all)
# Implement obstacle detection before each move to a new square. If a given sequence of commands encounters an obstacle,
# the rover moves up to the last possible point and reports the obstacle.
#
# Example: The rover is on a 100x100 grid at location (0, 0) and facing NORTH. The rover is given the commands
# "ffrff" and should end up at (2, 2)
# Tips: use multiple classes and TDD

  describe "Grid" do
    before(:all) do
      @grid = Grid.new(100, 100)
    end
    subject { @grid }

    it "has length" do
      should respond_to(:height)
    end

    it "has width" do
      should respond_to(:width)
    end

    it "can have obstacles on any cell" do
      should respond_to(:has_obstacles)
      @grid.has_obstacles(10, 10).should be_false

      should respond_to(:add_obstacles)
      @grid.add_obstacles(10, 10)
      @grid.has_obstacles(10, 10).should be_true
    end

  end

  describe "Rover" do
    before(:each) do
      @rover = Rover.new(0, 0)
    end
    subject { @rover }

    it "has a starting point" do
      should respond_to(:x)
      should respond_to(:y)

      @rover.x.should == 0
      @rover.x.should == 0
    end

    it "has a direction" do
      should respond_to(:direction)
    end

    context "moves" do

      it "can receive a character array of commands" do
        commands = "ffrff".split(//)
        commands.should be_a_kind_of(Array)
        @rover.move(commands)
      end

      it "f to move the rover in its direction" do
        expect {
          @rover.move(["f"])
        }.to change { @rover.y }.from(0).to(1)
      end

      it "b to move the rover in its direction" do
        expect {
          @rover.move(["b"])
        }.to change { @rover.y }.from(0).to(99)
      end

      it "l,r can turn the rover" do
        expect {
          @rover.move(["l"])
        }.to change { @rover.direction }.from(Direction::N).to(Direction::W)

        expect {
          @rover.move(["r"])
        }.to change { @rover.direction }.from(Direction::W).to(Direction::N)
      end

      it "commands can changes the location of rover" do
        # "ffrff" and should end up at (2, 2)

        expect {
          commands = "ffrff".split(//)
          commands.should be_a_kind_of(Array)
          @rover.move(commands)
        }.to change { @rover.direction }.from(Direction::N).to(Direction::E)

        @rover.x.should == 2
        @rover.x.should == 2
      end

      it "wraps at the end of the boundary" do
        expect {
          @rover.y = 99
          @rover.x = 0
          commands = "ffrff".split(//)
          commands.should be_a_kind_of(Array)
          @rover.move(commands)
        }.to change { @rover.direction }.from(Direction::N).to(Direction::E)

        @rover.x.should == 2
        @rover.y.should == 1
      end

      context "detects obstacle" do
        it "detects obstacle before move" do
          @rover.grid.has_obstacles(10, 10).should be_false

          @rover.grid.add_obstacles(10, 10)
          @rover.grid.has_obstacles(10, 10).should be_true
        end

        it "moves till last possible point" do

        end

        it "reports the obstacle" do
          @rover.grid.has_obstacles(10, 10).should be_false

          @rover.grid.add_obstacles(10, 10)
          @rover.grid.has_obstacles(10, 10).should be_true

          @rover.x = 10
          @rover.y = 9

          expect {
            @rover.move(["f"])
          }.to change { @rover.y }.from(9).to(9)
        end
      end

    end

  end

  describe "Mars Rover Game" do

    before(:each) do
      @game = MarsRoverGame.new(100, 100)
    end
    subject { @game }

    it "has a grid" do
      should respond_to(:grid)
    end

    it "has a Rover" do
      should respond_to(:rover)
    end

    it "in the begining, the rover is on a 100x100 grid at location (0, 0) and facing NORTH" do
      @game.grid.height.should ==100
      @game.grid.width.should ==100

      @game.rover.x.should == 0
      @game.rover.y.should == 0
      @game.rover.direction.should == Direction::N
    end

    it " then the rover is given the commands ffrff and should end up at (2, 2)" do
      expect {
        commands = "ffrff".split(//)
        commands.should be_a_kind_of(Array)
        @game.rover.move(commands)
      }.to change { @game.rover.direction }.from(Direction::N).to(Direction::E)

      @game.rover.x.should == 2
      @game.rover.y.should == 2
    end
  end

end