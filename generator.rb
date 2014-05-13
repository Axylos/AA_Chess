module Generator
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