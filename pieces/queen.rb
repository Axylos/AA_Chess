class Queen < SlidingPiece
  
  def initialize(position, player_color, board)
    super(position, player_color, board)
    @move_dirs = [:diagonal, :horizontal, :vertical]
  end
end