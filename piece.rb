class Piece    
  
  attr_reader :move_dirs, :position, :player_color
  
  def initialize(position, player_color)
    @position = position
    @player_color = player_color
  end
  
end 