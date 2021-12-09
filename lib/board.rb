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

  def valid_placement?(ship, selected_coordinates)
    true if ship.length == selected_coordinates.size
    # true if selected_coordinates.include?(@cells.keys.sort.each_cons(ship.length) {|a| a})
  end

  #
  # def place(ship, selected_coordinates)
  #   selected_coordinates.each do |coordinate|
  #     valid_coordinate?(coordinate)
  #     coordinate.empty?
  #   end
  #
  end
end
