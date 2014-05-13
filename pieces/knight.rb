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
  
  def initialize(position, color, board)
    super(position, color, board)
    @move_dirs = DELTAS
  end
end