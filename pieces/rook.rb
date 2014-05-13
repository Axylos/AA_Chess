class Rook < SlidingPiece
  
  def initialize(position, player_color)
    super(position, player_color)
    @move_dirs = [:vertical, :horizontal]
    super
  end
  
end