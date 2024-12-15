require_relative 'lib/base' 
require_relative 'lib/game_logic' 
require_relative 'lib/board' 

def main

  puts "Digite 1 para você criar o código e 2 para o computador criar o código"
  option = gets.chomp
  if option == "1"
    puts "Digite quantos algarismos o código deve ter:"
    num_pieces = gets.chomp.to_i
    board = Board.new(num_pieces, 10)
    board.display
    puts "Digite o código de #{board.num_pieces} algarismos entre #{(1..board.num_pieces)}"
    board.key = gets.chomp
    # p board.all_attempts
    board.solve(board.all_attempts.dup)
    loop do
      board.rows[board.turn] = board.solve_array[board.turn]
      board.display
      puts "press enter to continue"
      gets
      board.turn += 1  
      break if board.end_game?
    end
    if board.turn == 8
      puts "Perdeu!"
    else
      puts "Parabéns. Você ganhou!"
    end
  elsif option == "2"
    puts "Digite quantos algarismos o código deve ter:"
    num_pieces = gets.chomp.to_i
    board = Board.new(num_pieces, 10)
    board.display
    loop do
      board.ask_play
      board.display
      break if board.end_game?
    end
    if board.turn == 8
      puts "key: #{board.key}"
      puts "Perdeu!"
    else
      puts "Parabéns. Você ganhou!"
    end
  end
  board.display
end


main


# board.display
# p "num pieces: #{board.num_pieces}"



# p board.solve(board.all_attempts.dup, "1322")

