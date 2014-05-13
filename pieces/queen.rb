class Queen < SlidingPiece
  
  def initialize(position, player_color)
    super(position, player_color)
    @move_dirs = [:diagonal, :horizontal, :vertical]
  end
end