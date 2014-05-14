require "matrix"

class SlidingPiece < Piece 
  
  def compute_moves(move)
    moves = []
    current_move = self.position
    
    #possible_move = [Vector[move] + Vector[current_move]].map { |a, b| [a.to_i, b.to_i]}
    possible_move = [move[0] + current_move[0], move[1] + current_move[1]]
    
    moves << possible_move
     if @board.occupied?(possible_move) || moves.count >= 7
       return moves
     end
  end
  
  def moves
    output = []
    
    
    
    moves =  self.move_dirs.map { |direction| Piece::DELTAS[direction] }
    moves.each do |row|
      row.each do |move|
        output << compute_moves(move)
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
