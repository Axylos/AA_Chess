class Board
  def initialize
    @grid = Array.new(8) { Array.new(8) {nil} }
  end
  
  def [](pos)
    @grid[pos[0]][pos[1]]
  end
  
  def occupied?(pos)
    self[pos[0]] != nil
  end
end
