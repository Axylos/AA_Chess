class Bishop < SlidingPiece

  def initialize(position, player_color, board)
    super(position, player_color, board)
    @move_dirs = [:diagonal]
  end
end
