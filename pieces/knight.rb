class Knight < SteppingPiece
  
  DELTAS = [
    [2, 1], 
    [2, -1],
    [1, 2],
    [1, -2],
    [-2, 1],
    [-2, -1],
    [-1, 2],
    [-1, -2]
  ]
  
  def initialize(position, color)
    super(position, color)
    @move_dirs = DELTAS
  end
end