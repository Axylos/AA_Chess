class SlidingPiece < Piece 
  def valid_moves
    
  end
   
  def moves
    output = []
    
    cur_row = self.position[0]
    cur_col = self.position[1]
    
    #REFACTOR THIS
    if self.move_dirs.include?(:horizontal)
      possible_moves = (-7..7).map {|row| [(cur_row + row), cur_col] }
      valid_moves = possible_moves.select{ |row| (0..7).include?(row[0]) }
  
      output += rows
    end
    
    if self.move_dirs.include?(:vertical)
      possible_moves = (-7..7).map {|col| [cur_row, (cur_col + col)] }
      valid_moves = possible_moves.select{ |col| (0..7).include?(col[1]) }
      
      output += valid_moves
    end  
    
    if self.move_dirs.include?(:diagonal)
      possible_moves_right = (-7..7).map { |diag| [(cur_row - diag), (cur_col + diag)] }
      valid_moves_right = possible_moves_right.select { |row,col| (0..7).include?(col && row) }

      possible_moves_left = (-7..7).map { |diag| [(cur_row + diag), (cur_col + diag)] }
      valid_moves_left = possible_moves_left.select { |row,col| (0..7).include?(col && row) }

      output += (valid_moves_right + valid_moves_left)
    end

    output.delete(self.position)
    return output.uniq
  end
end
