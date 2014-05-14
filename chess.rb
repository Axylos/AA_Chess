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
require './player.rb'
require './game.rb'


b = Board.new
p1 = Player.new
p2 = Player.new
g = Game.new(p1, p2, b)
g.run