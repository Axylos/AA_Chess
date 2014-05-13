# encoding: utf-8

class Board
  
  WHITE = {
    :King =>  "♔",
    :Queen => "♕",
    :Rook => "♖",			
    :Bishop => "♗",	
    :Knight => "♘",	
    :Pawn => "♙"	
  }

  BLACK = {
    :King =>  "♚",
    :Queen => "♛",
    :Rook => "♜",			
    :Bishop => "♝",	
    :Knight => "♞",	
    :Pawn => "♟"	
  }

  def initialize
    @grid = Array.new(8) { Array.new(8) {nil} }
    generate_start_board
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
  
  def generate_start_board
    make_pawn_row(:black)
    make_pawn_row(:white)
  end
  
  def make_pawn_row(color)
    row = color == :black ? 1 : 6
    8.times do |col|
      pos = [row, col]
      self[pos] = Pawn.new(pos, color, self)
    end
  end
  
  def print_board  
    puts "   0 1 2 3 4 5 6 7"
    @grid.each_with_index do |row, index|
      pretty_row = row.map.with_index do |tile, col_index|
        if tile.nil?
          place = "_"
          
        else
          if tile.black?
            place = BLACK[tile.class.to_s.to_sym]
          else
            place = WHITE[tile.class.to_s.to_sym]
          end
        end
        place.colorize(index, col_index)
      end 
      
      print index
      print "  "
      puts pretty_row.join("|")
      #puts
      
    end
    
    
  end
  
end


class String
  def green
    "\033[32m#{self}\033[0m" 
  end
  
  def magenta
    "\033[35m#{self}\033[0m" 
  end
  
  def cyan
    "\033[36m#{self}\033[0m" 
  end
  
  def red
    "\033[31m#{self}\033[0m" 
  end 
  
  def bg_red
    "\033[41m#{self}\033[0m" 
  end
  
  def bg_gray
    "\033[47m#{self}\033[0m" 
  end
  
  
  def colorize(row, index)
    ctr = row.odd? ? true : false
    ctr = !ctr if index.odd?
      
    ctr ? self.bg_gray : self
  end
  
end
