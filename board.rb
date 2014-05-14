# encoding: utf-8
require './display.rb'
require './generator.rb'

class Board
  include Display
  include Generator

  attr_accessor :grid
  attr_reader :pieces_on_board
  
  def initialize
    @grid = Array.new(8) { Array.new(8) {nil} }
    @pieces_on_board = []
    generate_start_board
  end
  
  def add_piece_to_board(piece)
    @pieces_on_board << piece
  end
  
  def remove_piece_from_board(piece)
    @pieces_on_board.delete(piece)
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
    start_piece = self[start]
    if self.occupied?(end_pos)
      self[end_pos].remove_from_board
    end
    start_piece.move_to(end_pos)
    self[end_pos] = start_piece
    self[start] = nil
  end

  def moves_into_check?(move)
    own_color = self[move[0]].player_color
    new_board = self.deep_dup
    new_board.move move
    new_board.is_color_in_check?(own_color)
  end
  
  def is_color_in_check?(color)
    pieces = other_pieces(color)
    king_pos = find_king(color)
    pieces.any? { |piece| piece.valid_moves.include?(king_pos) }
  end
  
  def find_king(color)
    king = @pieces_on_board.select do |piece| 
      piece.is_a?(King) && piece.player_color == color
    end
    king.position
  end

  def other_pieces(color)
    @pieces_on_board.select { |piece| piece.player_color != color }
  end
  
  def deep_dup
    new_board = Board.new
  
    old_grid = self.grid
  
    new_grid = grid_dup(old_grid, new_board)
    
    new_board.grid = new_grid
    
    new_board
  end

  
  
  def grid_dup(old_grid, new_board)
    old_grid.map do |el|
      
      if el.is_a?(Array)
        grid_dup(el, new_board)
      else
        if el.nil?
          nil 
       else
         el.dup(new_board) 
       end
     end
    end
  end
  
end
