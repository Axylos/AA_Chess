class Bishop < SlidingPiece
  attr_accessor :move_dirs, :position
  
  def initialize(position, player_color)
    @position = position
    @move_dirs = [:diagonal]
  end
end
