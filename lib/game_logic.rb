
module GameLogic

  def get_all_attempts(num_pieces)
    # terminei aqui
    num = BaseNumber.new(0, num_pieces)
    arr = []
    attempts_length = (((num_pieces - 1).to_s)*num_pieces).to_i(num_pieces) 
    (0..attempts_length).each do |i|
      num_base = adjust((num + i).value_base.to_s, num_pieces)
      arr << translate_attempt(num_base)
    end
    arr
  end
  
  def adjust(string, num_pieces)
    string.rjust(num_pieces,"0")
  end

  def black(attempt, key)
    attempt.chars.each_with_index.reduce(0) do |acc, (item, index)|
      acc + (item == key[index] ? 1 : 0)
    end
  end
  
  def translate_attempt(attempt)
    attempt.chars.map{ |x| (x.to_i + 1).to_s}.join
    
  end

  def white(attempt, key) 
    attempt_hash = attempt.chars.tally
    key_hash = key.chars.tally
    n = attempt_hash.keys.reduce(0) do |acc, item|
      acc + [attempt_hash[item].to_i, key_hash[item].to_i].min
    end
    n - black(attempt, key)
  end
  
  def reduce_group(array_group, attempt, black, white)
    array_group.select! do |item| 
      # puts "#{item} - #{black(attempt, item)},#{white(attempt, item)} - #{black},#{white} "
      [black(attempt, item), white(attempt, item)] == [black, white]
    end
  end
  
  def solve(arr)
    cont = 0
    loop do
      puts "arr = #{arr}"
      attempt = arr[0]
      @solve_array << attempt.chars
      reduce_group(arr, attempt, black(attempt, @key), white(attempt, @key))
      @solve_array << arr[0].chars if arr.length == 1
      cont += 1
      # p cont
      break if (arr.length == 1)
    end
    arr[0]
  end
end




# #  555.base6
# teto_6 = 215

# attempt = "112"
# key = "121"

# puts "white: #{white(attempt, key)} - black: #{black(attempt, key)} "

# arr = []
# num = Base6Number.new(0)
# # puts "numero decimal: #{num.decimal_number} - numero base6: #{num.value_base_6}"
# (1..215).each do |i|
#   num_6 = adjust((num + i).value_base_6.to_s)
#   arr << num_6
#   puts " #{num.decimal_number + i} -> #{num_6}"
# end

# key = "554"

# solve(arr)



