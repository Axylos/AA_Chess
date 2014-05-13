# encoding: utf-8
require './display.rb'
require './generator.rb'

class Board
  include Display
  include Generator

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
  
  def move(start, end_pos)
    raise "No piece in that position!" if self[start].nil?
    raise "Invalid move!" if !(self[start].can_move_to?(end_pos))
    piece = self[start]
    
    #self[end_pos].remove_from_board if self[end_pos].occupied? 
      
    piece.move_to(end_pos)
    self[end_pos] = piece
    self[start] = nil
  end
  
  
  
end
