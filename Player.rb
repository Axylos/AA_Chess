class Player
  
  attr_accessor :player_color
  
  def get_input
    puts "Please input starting position as two seperate numbers, i.e. '3 4':"
    starting_position = gets.chomp.scan(/\d+/).map(&:to_i)
    puts "Please input ending position as two seperate numbers, i.e. '3 4':"
    ending_position = gets.chomp.scan(/\d+/).map(&:to_i)
    [starting_position, ending_position]
  end
end