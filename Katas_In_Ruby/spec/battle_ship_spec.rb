require "spec_helper"
require "../Katas/battle_ship"

describe "battleship game behaviour" do

  describe "player" do

    before() do
      @ship1 = Ship.new("patrol", 2)
      @ship2 = Ship.new("submarine", 3)
      @player = Player.new(1, [@ship1,@ship2] )
    end
    subject { @player }

    it "should have ships" do
      @player.should respond_to(:ships)
    end

    context " shoot" do
      #  msg  shoot(coord) return hit or miss or ou sunk my <ship type>
      it " should shoot " do
        @player.should respond_to(:shoot)
      end

      it "should hit a ship if fired at right target" do
        x = 0
        y = 0
        @player.shoot(x,y).should == "hit"
      end

      it "should miss a ship if fired at wrong target" do
        x = 0
        y = 1
        @player.shoot(x,y).should == "miss"
      end

      it "should sunk my ship if fired at for the right number of times" do
        @player.shoot(0,0).should == "hit"
        @player.shoot(1,0).should == "you sunk my patrol"
      end

      it "should not sink if fired at same target" do
        @player.shoot(0,0).should == "hit"
        @player.shoot(0,0).should_not == "you sunk my patrol"
      end

      it "should sink if all cells are hit" do
        @player.shoot(0,0).should == "hit"
        @player.shoot(1,0).should == "you sunk my patrol"
      end

      it "should say game over if last ship was hit" do
        @player.shoot(0,0).should == "hit"
        @player.shoot(1,0).should == "you sunk my patrol"
        @player.shoot(0,0).should == "hit"
        @player.shoot(1,0).should == "hit"
        @player.shoot(2,0).should == "game over"

      end
    end


  end

  context "ship" do
    before() do
      @ship = Ship.new("patrol", 2)
      #@ship = Ship.new("submarine", 3)
    end
    subject { @ship }

    it "should have a direction" do

    end

    it "should have a coordinates" do

    end

    it "should have a length" do

    end
  end

end