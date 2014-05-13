class Pawn < Piece

  def initialize(position, player_color)
    super(position, player_color)
    @move_dirs = get_move_dirs
  end
  
  def get_move_dirs
    vertical_dir = player_color == :black ? -1 : 1
    moves = [
      [vertical_dir, -1],
      [vertical_dir, 0],
      [vertical_dir, 1]
    ]
  end
  
  
end