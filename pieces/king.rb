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

  def initialize(position, color, board)
    super(position, color, board)
    @move_dirs = [ 
                    :lateral,  
                    :vertical,
                    :diagonal, 
                    :limit 
                  ]
  end
  
end