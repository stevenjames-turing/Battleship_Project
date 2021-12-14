class Board
  attr_reader :cells

  def initialize
    @cells = get_starting_board
    # @selected_coordinates = []
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

  # def ship_length_fit?(ship, selected_coordinates)
  #   ship.length == selected_coordinates.size
  # end
  #
  # def abc_placement?(ship, selected_coordinates)
  #   sc_array = selected_coordinates.map do |point|
  #     point.split(//)
  #   end
  #
  #   letters_array = [ ]
  #   sc_array.each do |letter, number|
  #     letters_array << letter.upcase
  #   end
  #
  #   numbers_array = []
  #   sc_array.map do |letter, number|
  #     numbers_array << number.to_i
  #     numbers_array
  #   end
  #
  #   letters_match = letters_array.all? do |letter|
  #     letter == letters_array[0]
  #   end
  #
  #   # numbers_up = numbers_array.last == (numbers_array.first + ship.length - 1)
  #   numbers_up = numbers_array.each_cons(2).all? {|a,b| b - a == 1}
  #
  #   return true if letters_match == true && numbers_up == true
  #   return false
  # end
  #
  # def numerical_placement?(ship, selected_coordinates)
  #   sc_array = selected_coordinates.map do |point|
  #     point.split(//)
  #   end
  #
  #   letters_array = [ ]
  #   sc_array.each do |letter, number|
  #     letters_array << letter.upcase
  #   end
  #
  #   numbers_array = []
  #   sc_array.map do |letter, number|
  #     numbers_array << number.to_i
  #     numbers_array
  #   end
  #
  #   numbers_match = numbers_array.all? do |number|
  #       number == numbers_array[0]
  #   end
  #
  #   # letters_up = letters_array[-1].ord == (letters_array[0].ord + ship.length - 1)
  #   letters_up = letters_array.each_cons(2).all? {|a,b| b.ord - a.ord == 1}
  #
  #   return true if numbers_match == true && letters_up == true
  #   return false
  # end
  #
  # def valid_placement_overlapping?(ship, selected_coordinates)
  #   selected_coordinates.each do |coordinate|
  #     if @cells[coordinate].empty?
  #       return true
  #     else
  #       return false
  #     end
  #   end
  # end
  #
  # def valid_placement?(ship, selected_coordinates)
  #   if !(ship_length_fit?(ship, selected_coordinates)) ; false
  #   elsif !(valid_placement_overlapping?(ship, selected_coordinates)) ; false
  #   elsif abc_placement?(ship, selected_coordinates) == true ; true
  #   elsif numerical_placement?(ship, selected_coordinates) == true ; true
  #   else
  #     return false
  #   end
  # end

  def valid_placement_length?(ship, selected_coordinates)
    if (ship.length == selected_coordinates.size)
      true
    else
      false
    end
  end

  def valid_placement_consecutive?(ship, selected_coordinates)
    numbers = []
    letters = []

    selected_coordinates.each do |coordinate|
      letters << coordinate.split("").first
      numbers << coordinate.split("").last.to_i
    end

    if letters.uniq.length == 1
      numbers.each_cons(2).all? do |coordinate_1, coordinate_2| # all? will return a TRUE/FALSE
        coordinate_2 == coordinate_1 + 1
      end
    elsif numbers.uniq.length == 1
      letters.each_cons(2).all? do |coordinate_1, coordinate_2| # all? will return a TRUE/FALSE
        coordinate_2.ord == coordinate_1.ord + 1
      end
    else
      false
    end
  end

  def valid_placement_overlapping?(ship, selected_coordinates)
    selected_coordinates.each do |coordinate|
      if @cells[coordinate].empty?
        return true
      else
        return false
      end
    end
  end

  def valid_placement?(ship, selected_coordinates)
    if valid_placement_length?(ship, selected_coordinates) && valid_placement_consecutive?(ship, selected_coordinates) && valid_placement_overlapping?(ship, selected_coordinates)
      true
    else
      false
    end
  end

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
