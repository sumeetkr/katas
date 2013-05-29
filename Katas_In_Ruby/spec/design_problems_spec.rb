require "spec_helper"

describe "FizzBuzz behaviour" do

  #"Write a program that prints the numbers from 1 to 100. But for multiples of three print “Fizz”
  # instead of the number and for the multiples of five print “Buzz”.
  # For numbers which are multiples of both three and five print “FizzBuzz”."
  it "should do print fizz buzz" do
    for i in 1..100
      case 0
        when i%3 + i%5
          then puts "FizzBuzz"
        when i%5
          puts "Buzz"
        when i%3
            puts "Fizz"
        else puts i
      end
    end
  end

# Write a program that takes in a tic-tac-toe board (3x3) as input (it can be in whatever
# representation or format you choose). You must determine which of the following four
# states the board is in: player X won, player O won, stalemate, continue playing

  describe "tictactoe game" do
    before()do
      @board = Array.new(3){Array.new(3)}

      for right in 0..2
        for down in 0..2
          @board[right][down] = CellState::Empty
        end
      end
    #@board.each do |col|
    #  col.each do |cell|
    #    cell = 0
    #  end
    #end
    end

    it "should have Empty cells" do
      @board[0][0].should == CellState::Empty
    end

    it "should make player X win" do
      x_wins = false

      for i in 0..2
        case true
          when @board[i][0] == CellState::Cross && @board[i][1] == CellState::Cross && @board[i][2] == CellState::Cross
          then x_wins = true

          when @board[0][i] == CellState::Cross && @board[1][i] == CellState::Cross && @board[2][i] == CellState::Cross
          then x_wins = true
        end
        break if x_wins
      end

      if(!x_wins)
        if(@board[0][0] == CellState::Cross && @board[1][1] == CellState::Cross && @board[2][2] == CellState::Cross)
          x_wins = true
        else if(@board[0][2] == CellState::Cross && @board[1][1] == CellState::Cross && @board[2][0] == CellState::Cross)
            x_wins = true
            end
        end
      end

      return x_wins

    end

    it "should make player O win" do

    end

    it "should stalemate the game" do

    end

    it "should continue the game" do
      should_continue = false
      for right in 0..2

        for down in 0..2
          if(@board[right][down] = CellState::Empty)
            should_continue = true
            break
          end
        end

        break if should_continue
      end
    end

  end
end

module CellState
  Zero = 0
  Cross = 1
  Empty = 2
end

module GameState
  Continue = 0
  StaleMate = 1
  XWins = 2
  OWins = 3
end