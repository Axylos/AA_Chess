class Game
  attr_reader :board
  
  def initialize(player1,player2, board)
    @player1, @player2, @board = player1, player2, board
    @player1.player_color = :black
    @player2.player_color = :white
  end
  
  def run
    @current_player = @player2
    loop do
      puts "The current player is: #{@current_player.player_color}"
      board.print_board
      
      begin 
        player_input = @current_player.get_input
        handle_input(player_input)
      rescue => e
        puts "Looks like something went wrong:\n #{e}"
        
        retry
      end
      
      @current_player = @current_player == @player1 ? @player2 : @player1
      
      break if @board.checkmate?(@current_player.player_color)
    end
    @current_player = @current_player == @player1 ? @player2 : @player1
    puts "Game Over: #{@current_player.player_color} Won!"
  end
  
  
  def handle_input(input)
    start_pos, end_pos = input
    if @board.moves_into_check?(start_pos, end_pos)
      raise "You can't move into check!"
    end
    
    if @board[start_pos].player_color != @current_player.player_color
      raise "Nice Try!  Move your own pieces."
    end
    other_color = @current_player.player_color == :white ? :black : :white
    
    @board.move(start_pos, end_pos)
    
    puts "Check!" if @board.is_color_in_check?(other_color, board)
    
  end
end