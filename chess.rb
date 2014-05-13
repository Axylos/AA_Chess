require "debugger"

require 'pry'
require './board.rb'
require './piece.rb'
require './sliding_piece.rb'
require './stepping_piece.rb'
require './pieces/rook.rb'
require './pieces/bishop.rb'
require './pieces/queen.rb'
require './pieces/king.rb'
require './pieces/knight.rb'
require './pieces/pawn.rb'




b = Board.new
bishop1 = Bishop.new([2,2], :b, b)
bishop2 = Bishop.new([4,4], :b, b)
b[bishop1.position] = bishop1
b[bishop2.position] = bishop2
p bishop1.valid_moves