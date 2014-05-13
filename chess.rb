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
rook1 = Rook.new([4,6], :b, b)
rook2 = Rook.new([3,6], :b, b)
b[rook1.position] = rook1
b[rook2.position] = rook2
p rook2.valid_moves