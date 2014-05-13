class SlidingPiece < Piece 
  
=begin   
  #beginning of refactor
  def pos_horizontal_coord(offset)
    
  end
  
  def neg_horizontal_coord(offset)
    [cur_row, cur_col - offset]
  end
  
  def horizontal_coord
    pos = Proc.new { |offset| [cur_row, cur_col + offset] }
    neg = Proc.new { |offset| [cur_row, cur_col - offset] }
    
    calculate_moves(pos, neg)
  end
  
  def calculate_moves(&pos_coor, &neg_coor)
    range.each do |offset|
      coordinate = pos_coor.call(offset)
      output << coordinate
      break if @board.occupied?(coordinate)
    end
    
    range.each do |offset|
      coordinate = neg_coor.call(offset)
      output << coordinate
      break if @board.occupied?(coordinate)
    end
  end
  
  #end of refactor
=end       
  def moves
    output = []
    
    cur_row = self.position[0]
    cur_col = self.position[1]
    
    range = (1..7)
    
    
        
    if self.move_dirs.include?(:horizontal)     
      range.each do |offset|
        coordinate = [cur_row, cur_col + offset]
        output << coordinate
        break if @board.occupied?(coordinate)
      end
      
      range.each do |offset|
        coordinate = [cur_row, cur_col - offset]
        output << coordinate
        break if @board.occupied?(coordinate)
      end
    end

    if self.move_dirs.include?(:vertical)
      range.each do |offset|
        coordinate = [cur_row + offset, cur_col]
        output << coordinate
        next unless (cur_row + offset).between?(0,7)
        break if @board.occupied?(coordinate)
      end
      
      range.each do |offset|
        coordinate = [cur_row - offset, cur_col]
        output << coordinate
        next unless (cur_row + offset).between?(0,7)
        break if @board.occupied?(coordinate)
      end
    end  
  
    if self.move_dirs.include?(:diagonal)
      range.each do |offset|
        coordinate = [cur_row - offset, cur_col + offset]
        output << coordinate
        next unless (cur_row + offset).between?(0,7)
        break if @board.occupied?(coordinate)
      end
      
      range.each do |offset|
        coordinate = [cur_row + offset, cur_col - offset]
        output << coordinate
        next unless (cur_row + offset).between?(0,7)
        break if @board.occupied?(coordinate)
      end
      
      range.each do |offset|
        coordinate = [(cur_row + offset), (cur_col + offset)]
        output << coordinate
        next unless (cur_row + offset).between?(0,7)
        break if @board.occupied?(coordinate)
      end
      
      range.each do |offset|
        coordinate = [(cur_row - offset), (cur_col - offset)]
        output << coordinate
        next unless (cur_row + offset).between?(0,7)
        break if @board.occupied?(coordinate)
      end

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
