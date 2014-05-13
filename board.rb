class Board
  WHITE = {
    King =>  "\u2654",
    Queen => "\u2655",
    Rook => "\u2656",			
    Bishop => "\u2657",	
    Knight => "\u2658",	
    Pawn => "\u2659"	
  }

  BLACK = {
    King =>  "\u265A",
    Queen => "\u265B",
    Rook => "\u265C",			
    Bishop => "\u265D",	
    Knight => "\u265E",	
    Pawn => "\u265F"	
  }
  
  def initialize
    @grid = Array.new(8) { Array.new(8) {nil} }
  end
  
  def [](pos)
    @grid[pos[0]][pos[1]]
  end
  
  def []=(pos, piece)
    @grid[pos[0]][pos[1]] = piece
  end
  
  def occupied?(pos)
    self[pos] != nil
  end
  
  def print_board
    "\u2654"
  end
  
end