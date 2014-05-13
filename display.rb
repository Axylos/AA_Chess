module Display
  
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
  