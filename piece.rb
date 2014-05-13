class Piece    
  
  attr_reader :move_dirs, :position, :player_color
  
  def initialize(position, player_color)
    @position = position
    @player_color = player_color
  end
  
  def valid_moves(board)
    moves_on_board = self.moves.select do |row,col| 
      (0..7).include?(col) && (0..7).include?(row) 
    end
    
    no_friendly_fire = moves_on_board.reject do |pos|
      board[pos].occupied? && board[pos].player_color == player_color 
    end
    
    no_friendly_fire
  end
  
end 