class Pawn < Piece

  def initialize(position, player_color, board)
    super(position, player_color, board)
    @move_dirs = get_move_dirs
  end
  
 
  
  def moves
    get_move_dirs.map do |move|
      x, y = move
      [x + @position[0], y + @position[1]] 
    end
  end
  
  private 
  
  def get_move_dirs
    vertical_dir = player_color == :black ? 1 : -1
    moves = [
      [vertical_dir, 0],
      [vertical_dir, -1],
      [vertical_dir, 1]
    ]
  end
  
  def valid_moves
    possibles = moves
    valids = []
    valids << possibles.shift
    
    possibles.each do |move|
      
      if !@board[move].nil? && @board[move].player_color != self.player_color
        valids << move
      end
    end
    
    
    valids    
  end
end