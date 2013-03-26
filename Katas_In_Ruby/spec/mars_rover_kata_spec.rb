require "spec_helper"
require "../Katas/mars_rover_kata"

describe "MarsRover behaviour" do
  #Develop an api that moves a rover around on a grid.
  #You are given the initial starting point (x,y) of a rover and the direction (N,S,E,W) it is facing.
  #The rover receives a character array of commands.
  # Implement commands that move the rover forward/backward (f,b).
  # Implement commands that turn the rover left/right (l,r).
  # Implement wrapping from one edge of the grid to another. (planets are spheres after all)
  #Implement obstacle detection before each move to a new square.
  #If a given sequence of commands encounters an obstacle, the rover moves up to the last possible point and reports the obstacle.

  context "cell" do

    before(:each) do
      @cell = Cell.new(10, 10)
    end
    subject { @cell }

    it { should respond_to(:x_location) }
    it { should respond_to(:y_location) }
  end

  context "grid" do
    before(:each) do
      @grid = Grid.new(10)
    end

    subject { @grid }

    it { should respond_to(:cell_array) }
    it "should have the initialized width and height" do
      @grid.cell_array.length == 10
      @grid.cell_array[0].length == 10
    end
  end

  context "Rover" do
    before(:each) do
      grid = Grid.new(10)
      @rover = Rover.new(grid, 5, 5)
    end
    subject { @rover }

    it { should respond_to(:direction) }

    it "should turn left" do
      lambda {
        @rover.turn(MotionDirection::L)
      }.should change(@rover, :direction).by(-1)
    end

    it "should turn right" do
      lambda {
        @rover.turn(MotionDirection::R)
      }.should change(@rover, :direction).by(1)
    end

    it "should move" do
      lambda {
        @rover.change_location(1, 0)
      }.should change(@rover, :x).by(1)

      lambda {
        @rover.change_location(0, 1)
      }.should change(@rover, :y).by(1)
    end


    it "should wrap" do
      @rover.x = 10
      lambda {
        @rover.change_location(1, 0)
      }.should change(@rover, :x).by( -9)

      @rover.y = 10
      lambda {
        @rover.change_location(0, 1)
      }.should change(@rover, :y).by( -9)
    end

  end

  context "MarsRoverGame" do
    before(:each) do
      @game = MarsRoverGame.new()
    end
    subject { @game }

    it { should respond_to(:rover) }
    it { should respond_to(:grid) }

    it "should change state of rover - case 1" do
      @game.rover.move(MotionDirection::F)
      @game.rover.x == 1
      @game.rover.y == 0
    end

    it "should change state of rover - case 2" do
      @game.rover.move(MotionDirection::L)
      @game.rover.x == 0
      @game.rover.y == 0
      @game.rover.direction == Direction::N
    end

    it "should change state of rover - case 3" do
      @game.rover.move(MotionDirection::L)
      @game.rover.move(MotionDirection::F)
      @game.rover.move(MotionDirection::F)
      @game.rover.move(MotionDirection::F)
      @game.rover.x == 0
      @game.rover.y == 2
      @game.rover.direction == Direction::N
    end

  end

end