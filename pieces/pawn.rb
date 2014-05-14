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
  
  
  def get_move_dirs
    vertical_dir = player_color == :black ? 1 : -1
    
    directions = [
      [vertical_dir, 0],
      [vertical_dir, -1],
      [vertical_dir, 1]
    ]
    
    if self.position[0] == 6 || self.position[0] == 1
      directions << [vertical_dir*2, 0]
    end
    directions
  end
  
  def valid_moves
    possibles = moves
    valids = []
    valids << possibles.pop if possibles.count == 4#shhhh no one talk about this
    valids << possibles.shift
    
    possibles.each do |move|      
      if !@board[move].nil? && @board[move].player_color != self.player_color
        valids << move
      end
    end
    
    valids.reject! { |move| @board.occupied?(move) && move[1] == @position[1] }
    valids.select { |x,y| x.between?(0,7) && y.between?(0,7)}
      
  end
end