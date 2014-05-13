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
b.print_board

b.move([6,1],[5,1])
b.print_board
b.move([1, 2], [2, 2])
b.move([2, 2], [3, 2])
b.move([3, 2], [4,3])

b.print_board