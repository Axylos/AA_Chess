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
  
  def move(start, end_pos)
    raise "No piece in that position!" if self[start].nil?
    raise "Invalid move!" if !(self[start].can_move_to?(end_pos))
    piece = self[start]
    piece.move_to(end_pos)
    self[end_pos] = piece
    self[start] = nil
  end
  
  def generate_start_board
    [:white, :black].each do |color|
      make_pawn_row(color)
      make_home_row(color)
    end
  end
  
  def make_pawn_row(color)
    row = color == :black ? 1 : 6
    8.times do |col|
      pos = [row, col]
      self[pos] = Pawn.new(pos, color, self)
    end
  end
  
  def make_home_row(color)
    row = color == :black ? 0 : 7
    8.times do |col|
      pos = [row, col]
      case col
      when 0
        self[pos] = Rook.new(pos, color, self)
      when 1
        self[pos] = Knight.new(pos, color, self)
      when 2 
        self[pos] = Bishop.new(pos, color, self)
      when 3
        self[pos] = Queen.new(pos, color, self)
      when 4
        self[pos] = King.new(pos, color, self)
      when 5
        self[pos] = Bishop.new(pos, color, self)
      when 6
        self[pos] = Knight.new(pos, color, self)
      when 7
        self[pos] = Rook.new(pos, color, self)
      end
    end
  end
  
end
