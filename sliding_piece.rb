class SlidingPiece < Piece  
  def moves
    output = []
    if self.move_dirs.include?(:horizontal)
      x_coors = (-7..7).map {|x_coor| [(self.position[0] + x_coor), self.position[1]] }
        .select{ |x_coor| (0..7).include?(x_coor[0]) }
      output += x_coors
    end
    
    if self.move_dirs.include?(:vertical)
      y_coors = (-7..7).map {|y_coor| [self.position[0], (self.position[1] + y_coor)] }
        .select{ |y_coor| (0..7).include?(y_coor[1]) }
        output += y_coors
    end  
    
    if self.move_dirs.include?(:diagonal)
      diag_right = (-7..7).map { |diag_coor| [(self.position[0] - diag_coor), (self.position[1] + diag_coor)] }
      .select { |diag_coor| (0..7).include?(diag_coor[1]) && (0..7).include?(diag_coor[0]) }
      output += diag_right
      
      diag_left = (-7..7).map { |diag_coor| [(self.position[0] + diag_coor), (self.position[1] + diag_coor)] }
      .select { |diag_coor| (0..7).include?(diag_coor[1]) && (0..7).include?(diag_coor[0]) }
      output += diag_left

    end

    output.delete(self.position)
    return output.uniq
  end
end
