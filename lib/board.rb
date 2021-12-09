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

  # def valid_placement?(ship, selected_coordinates)
  #   true if ship.length == selected_coordinates.size
  #   # true if selected_coordinates.include?(@cells.keys.sort.each_cons(ship.length) {|a| a})
  # end


  def place(ship, selected_coordinates)
    selected_coordinates.each do |coordinate|
      if valid_coordinate?(coordinate) == true && @cells[coordinate].empty? == true
        @cells[coordinate].place_ship(ship)
      end
    end
  end

  def render(option = nil)
    board_string = "  1 2 3 4 \n" +
    "A #{@cells["A1"].render(option)} #{@cells["A2"].render(option)} #{@cells["A3"].render(option)} #{@cells["A4"].render(option)} \n" +
    "B #{@cells["B1"].render(option)} #{@cells["B2"].render(option)} #{@cells["B3"].render(option)} #{@cells["B4"].render(option)} \n" +
    "C #{@cells["C1"].render(option)} #{@cells["C2"].render(option)} #{@cells["C3"].render(option)} #{@cells["C4"].render(option)} \n" +
    "D #{@cells["D1"].render(option)} #{@cells["D2"].render(option)} #{@cells["D3"].render(option)} #{@cells["D4"].render(option)} \n"
    puts board_string
    return board_string
  end

end
