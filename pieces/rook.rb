class Rook < SlidingPiece
  
  def initialize(position, player_color, board)
    super(position, player_color, board)
    @move_dirs = [:vertical, :horizontal]
  end
  
end