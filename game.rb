class Game
  attr_reader :board
  
  def initialize(player1,player2, board)
    @player1, @player2, @board = player1, player2, board
    @player1.player_color = :black
    @player2.player_color = :white
  end
  
  def run
    board.print_board
    loop do
      #check for check and checkmate
      board.print_board
      #get player input
      #handle input
      @current_player = @current_player == @player1 ? @player2 : @player1
    end
    #final message
  end
end