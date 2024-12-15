class Board
  attr_accessor :rows, :num_rows, :key, :solve_array, :turn
  attr_reader :all_attempts, :num_pieces

  include GameLogic # terminei aqui


  def initialize(num_pieces, num_rows)
    @num_pieces = num_pieces
    @num_rows = num_rows
    @rows = Array.new(num_rows){ Array.new(num_pieces,nil) }
    @all_attempts = self.get_all_attempts(num_pieces)
    @key = @all_attempts.sample
    @solve_array = []

    @turn = 0
    @current_play
  end


  def generate_key
    @key = @all_attempts.sample
  end

  def draw_last_piece(row, piece)
    white_hint = piece == "   " ? 0 : self.white(row.join, @key)
    black_hint = piece == "   " ? 0 : self.black(row.join, @key)
    # puts ""
    # puts "white_int: #{white_hint}"
    puts "#{piece}|#{"*"*black_hint}#{"O"*white_hint}"
  end

  def draw_bar
    puts "|#{"-"*(4*@num_pieces - 1)}|#{"-"*@num_pieces}"
  end

  def display
    puts "rows: #{@rows}" 
    @rows.reverse.each do |row|
      print_row(row)
    end
  end
  
  def print_row(row)
    print "|"
    # puts row
    row.each_with_index do |piece, index|
      piece = piece == nil ? "   ": " #{piece} "
      if index == @num_pieces - 1
        draw_last_piece(row, piece)
        draw_bar
      else
        print "#{piece}|"
      end
    end
  end


  def good_play?
    # puts "@current_play: #{@current_play}"
    has_minimum_digits = @current_play.length >= @num_pieces
    # puts "has min dig: #{has_minimum_digits}"  
    has_right_digits = @current_play[0, @num_pieces].all? { |item| item.to_i.between?(1, @num_pieces) }
    has_minimum_digits && has_right_digits
  end
  
  def ask_play
    loop do 
      puts "digite sua jogada"
      @current_play = gets.chomp.scan(/\d/)
      if good_play?
        @rows[@turn] = @current_play[0, num_pieces]
      end
      break if (@rows[@turn][0] != nil)
    end
    puts "jogada aceita"
    @turn += 1
  end

  def end_game?
    @turn == @num_rows || @rows[@turn].join == @key
  end

end
  


# p board.all_attempts

