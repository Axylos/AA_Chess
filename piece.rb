class Piece    
  
  DELTAS = { 
              :horizontal => [ [0, 1], [0, -1] ],
  
              :vertical => [ [1, 0], [-1, 0] ],
  
              :diagonal => [ [1, 1], [-1, -1 ], [1, -1], [-1, 1] ] 
              
            }
  
  
  attr_reader :move_dirs, :position, :player_color
  
  def initialize(position, player_color, board)
    @position = position
    @player_color = player_color
    @board = board
    puts_self_on_board
  end
  
  def puts_self_on_board
    @board.add_piece_to_board(self)
  end
  
  def remove_from_board
    @board.remove_piece_from_board(self)
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
    #[] if @player_color
    valid_moves.include?(end_pos)
  end   
  
  def dup(new_board)
    self.class::new(self.position, self.player_color, new_board)
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
 
end 