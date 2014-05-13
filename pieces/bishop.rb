class Bishop < SlidingPiece

  def initialize(position, player_color)
    super(position, player_color)
    @move_dirs = [:diagonal]
  end
end
