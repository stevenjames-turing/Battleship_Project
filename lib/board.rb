class Board
  attr_reader :cells

  def initialize
    @cells = get_starting_board
  end

def get_starting_board
    starting_board = {}
    ("A".."D").each do |y_axis|
      (1..4).each do |x_axis|
        cell_coordinate = "#{y_axis}#{x_axis}"
        starting_board[cell_coordinate] = Cell.new(cell_coordinate)
      end
    end
    starting_board
  end

  def valid_coordinate?(coordinate)
    @cells.keys.include?(coordinate)
  end
end
