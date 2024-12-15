class BaseNumber
  def initialize(decimal_number, num_pieces)
    @num_pieces = num_pieces
    @decimal_number = decimal_number
    @value_base = decimal_number.to_s(num_pieces).to_i
  end

  attr_reader :value_base

  def +(other)
    new_decimal = @decimal_number + other
    BaseNumber.new(new_decimal, @num_pieces)
  end

  def decimal_number
    @value_base.to_s.to_i(@num_pieces)
  end
end

# class Base6Number
#   def initialize(decimal_number)
#     @decimal_number = decimal_number
#     @value_base = decimal_number.to_s(6).to_i
#   end

#   attr_reader :value_base_6

#   def +(other)
#     new_decimal = @decimal_number + other
#     Base6Number.new(new_decimal)
#   end

#   def decimal_number
#     @value_base.to_s.to_i(6)
#   end
# end

