require_relative 'base' 
require_relative 'game_logic' 


class Board
  attr_accessor :rows, :num_rows
  attr_reader :all_attempts

  include GameLogic # terminei aqui


  def initialize(num_pieces, num_rows)
    @num_pieces = num_pieces
    @num_rows = num_rows
    @rows = Array.new(num_rows){ Array.new(num_pieces,nil) }
    @all_attempts = self.get_all_attempts(num_pieces)
  end

  def display
    @rows.each do |row|
      print_row(row)
    end
  end

  def draw_last_piece(piece)
    puts "#{piece}|**OO|"
  end

  def draw_bar
    puts "|#{"-"*(4*@num_pieces - 1)}|#{"-"*@num_pieces}"
  end
  
  def print_row(row)
    print "|"
    row.each_with_index do |piece, index|
      piece = piece == nil ? "   ": " #{piece} "
      if index == @num_pieces - 1
        draw_last_piece(piece)
        draw_bar
      else
        print "#{piece}|"
      end
    end
  end

end
  

board = Board.new(3,8)

board.display
p board.all_attempts
board.solve(board.all_attempts, "322")
