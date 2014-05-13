class King < SteppingPiece
  DELTAS = [
    [0,1],
    [1,1],
    [1,0],
    [1,-1],
    [0,-1],
    [-1,1],
    [-1,0],
    [-1,-1]
  ]

  def initialize(position, player_color)
    super(position, player_color)
  end
end