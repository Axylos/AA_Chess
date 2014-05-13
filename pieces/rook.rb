class Rook < SlidingPiece
  
  def initialize(position, player_color)
    @position = position
    @move_dirs = [:vertical, :horizontal]
    super
  end
  
end