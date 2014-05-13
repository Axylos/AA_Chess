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

  def initialize(position, color)
    super(position, color)
    @move_dirs = DELTAS
  end
  
end