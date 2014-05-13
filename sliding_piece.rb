class SlidingPiece < Piece 
       
  def moves
    output = []
    
    cur_row = self.position[0]
    cur_col = self.position[1]
    
    plus_range = (1..7)
    minus_range = (-7..-1).to_a.reverse
    
    if self.move_dirs.include?(:horizontal)
      
      plus_range.each do |offset|
        coordinate = [cur_row, cur_col + offset]
        output << coordinate
        break if @board.occupied?(coordinate)
      end
      
      minus_range.each do |offset|
        coordinate = cur_row, cur_col + offset
        output << coordinate
        break if @board.occupied?(coordinate)
      end
    end
    
    if self.move_dirs.include?(:vertical)
      plus_range.each do |offset|
        coordinate = cur_row + offset, cur_col
        output << coordinate
        break if @board.occupied?(coordinate)
      end
      
      minus_range.each do |offset|
        coordinate = cur_row + offset, cur_col
        output << coordinate
        break if @board.occupied?(coordinate)
      end
    end  
    
    if self.move_dirs.include?(:diagonal)
      possible_moves_right = (-7..7).map { |diag| [(cur_row - diag), (cur_col + diag)] }
      possible_moves_left = (-7..7).map { |diag| [(cur_row + diag), (cur_col + diag)] }

      output += (possible_moves_right + possible_moves_left)
    end

    output.delete(self.position)
    return output.uniq
  end
end

=begin
    
    if self.move_dirs.include?(:horizontal)
      possible_moves = (-7..7).map {|row| [(cur_row + row), cur_col] }
      output += possible_moves
    end

      possible_moves = (-7..7).map {|col| [cur_row, (cur_col + col)] }
      
      output += possible_moves
=end
