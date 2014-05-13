class Piece    
  
  attr_reader :move_dirs, :position, :player_color
  
  def initialize(position, player_color, board)
    @position = position
    @player_color = player_color
    @board = board
  end
  
  def valid_moves
    moves_on_board = self.moves.select do |row,col| 
      (0..7).include?(col) && (0..7).include?(row) 
    end
    
    no_friendly_fire = moves_on_board.reject do |pos|
      @board.occupied?(pos) && @board[pos].player_color == player_color 
    end
    
    no_friendly_fire
  end
  
  def move_to(pos)
    @position = pos
  end
  
  def black?
    @player_color == :black
  end
  
  def white?
    @player_color == :white
  end
  
  def can_move_to?(end_pos)
    [] if @player_color
    self.valid_moves.include?(end_pos)
  end   
  
 
end 