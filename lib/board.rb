class Board
  attr_reader :cells

  def initialize
    @cells = get_starting_board
  end

  # Called at #initialize. Creates the board and assigns a Cell object
  # to each coordinate on the board.
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

  # Checks the coordinate passed as argument against the Cells on the board.
  # returns true if coordinate matches one of the Cells.
  def valid_coordinate?(coordinate)
    @cells.keys.include?(coordinate)
  end

  def ship_length_fit?(ship, selected_coordinates)
    ship.length == selected_coordinates.size
  end

  def abc_placement?(ship, selected_coordinates)
    sc_array = selected_coordinates.map do |point|
      point.split(//)
    end

    letters_array = [ ]
    sc_array.each do |letter, number|
      letters_array << letter.upcase
    end

    numbers_array = []
    sc_array.map do |letter, number|
      numbers_array << number.to_i
      numbers_array
    end

    letters_match = letters_array.all? do |letter|
      letter == letters_array[0]
    end
    
    numbers_up = numbers_array.each_cons(2).all? {|a,b| b - a == 1}

    return true if letters_match == true && numbers_up == true
    return false
  end

  def numerical_placement?(ship, selected_coordinates)
    sc_array = selected_coordinates.map do |point|
      point.split(//)
    end

    letters_array = [ ]
    sc_array.each do |letter, number|
      letters_array << letter.upcase
    end

    numbers_array = []
    sc_array.map do |letter, number|
      numbers_array << number.to_i
      numbers_array
    end

    numbers_match = numbers_array.all? do |number|
        number == numbers_array[0]
    end

    letters_up = letters_array.each_cons(2).all? {|a,b| b.ord - a.ord == 1}

    return true if numbers_match == true && letters_up == true
    return false
  end

  # Checks that each Cell included in the selected_coordinates is empty.
  # Returns true if empty? == true for each coordinate passed through.
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
    if !(ship_length_fit?(ship, selected_coordinates)) ; false
    elsif !(valid_placement_overlapping?(ship, selected_coordinates)) ; false
    elsif abc_placement?(ship, selected_coordinates) == true ; true
    elsif numerical_placement?(ship, selected_coordinates) == true ; true
    else
      return false
    end
  end

  # Accepts coordinates and a ship as arguments. If coordinates pass #valid_coordinate
  # the ship is then placed on each coordinate. This places a single Ship object
  # across multiple coordinates to match the length of the ship.
  def place(ship, selected_coordinates)
    selected_coordinates.each do |coordinate|
      if valid_coordinate?(coordinate) == true && @cells[coordinate].empty? == true
        @cells[coordinate].place_ship(ship)
      end
    end
  end

  # Renders board in a visible way for the user to see their ships.
  # Allows a user to see any prior shot history.
  # Optional argument allows player to view their own current ship locations on board.
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
