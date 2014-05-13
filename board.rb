class Board
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
end
