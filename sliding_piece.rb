require "matrix"

class SlidingPiece < Piece 
  
  def compute_moves(move)
    moves = []
    current_move = self.position
     
    loop do
      possible_move = [move[0] + current_move[0], move[1] + current_move[1]]
      break if possible_move.any? {|el| !(el.between?(0,7))}
      moves << possible_move
      break if @board.occupied?(possible_move)
      current_move = possible_move  
     end
     
     moves
  end
  
  def moves
    output = []
      
    directions =  self.move_dirs.map { |direction| Piece::DELTAS[direction] }
    directions.each do |direction|
      direction.each do |move|
        output += compute_moves(move)
      end
      
    end
    
    output.delete(self.position)
    return output.uniq
  end
end