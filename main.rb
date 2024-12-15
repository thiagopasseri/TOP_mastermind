require_relative 'lib/base' 
require_relative 'lib/game_logic' 
require_relative 'lib/board' 

def main
    board = Board.new(3,6)
    board.display

    loop do
        board.ask_play
        board.display
        break if board.end_game?
    end
    if board.turn == 8
        puts "Perdeu!"
    else
        puts "Parabéns. Você ganhou!"
    end
end


main


# board.display
# p "num pieces: #{board.num_pieces}"



# p board.solve(board.all_attempts.dup, "1322")

