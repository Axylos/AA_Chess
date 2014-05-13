class SteppingPiece < Piece
  
  def moves
    
    cur_row = self.position[0]
    cur_col = self.position[1]
    
    possible_moves = @move_dirs.map { |row, col| [(cur_row + row), (cur_col + col)]}
    
  end
end
