# encoding: utf-8

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
#b.print_board

#b.move([6,1],[5,1])
#b.print_board
#b.move([7,6], [5, 5])
#b.move([5, 5], [3, 4])
#b.move([3, 4], [1,5])
#b.move([7,2],[5,0])
#b.move([5,0], [1,4])
#b.move([6,4], [4,4])
#pawn = b[[6, 1]]
#p pawn.position
b.print_board
b.move([6,1], [4,1])


b.print_board
b.move([4,1], [2,1])
b.print_board