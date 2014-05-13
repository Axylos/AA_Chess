class Piece    
  
  attr_reader :move_dirs, :position, :player_color
  
  def initialize(position, player_color)
    @position = position
    @player_color = player_color
  end
  
  def valid_moves
    self.moves.select { |row, col| (0..7).include?(col) && (0..7).include?(row) }
  end
  
end 