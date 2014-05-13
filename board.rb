# encoding: utf-8
require './display.rb'

class Board
  include Display
  
  

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
  
  
end
