class Battle
  attr_reader :board, :ships

  def initialize
    @board = Board.new
    @ships = get_starting_ships
  end

  def get_coordinates
    gets.chomp.split(" ")
  end

  def get_starting_ships
    available_ships = [[cruiser = Ship.new("Cruiser", 3)], [submarine = Ship.new("Submarine", 2)]]
    available_ships.sample(2)
  end

# Get's info from player and places Cruiser
# ISSUES: Cruiser is hardcoded.
  # def player_place_cruiser
  #   cruiser = Ship.new("Cruiser", 3)
  #   selected_coordinates = get_coordinates
  #
  #   until @board.valid_placement?(cruiser, selected_coordinates) == true
  #     p "Those are invalid coordinates. Please try again:"
  #     get_coordinates
  #   end
  #   @board.place(cruiser, selected_coordinates)
  # end

  # Get's info from player and places Submarine
  # ISSUES: Submarine is hardcoded.
  # def player_place_submarine
  #   submarine = Ship.new("Submarine", 2)
  #   selected_coordinates = get_coordinates
  #
  #   until @board.valid_placement?(submarine, selected_coordinates) == true
  #     p "Those are invalid coordinates. Please try again:"
  #     get_coordinates
  #   end
  #   @board.place(submarine, selected_coordinates)
  # end

  # # THIS IS DESIGNED TO REPLACE THE HARDCODED SHIPS FOR THE PLAYER_PLACE METHOD
  # def player_place_ship(ship)
  #   selected_coordinates = get_coordinates
  #
  #   until @board.valid_placement?(ship, selected_coordinates) == true
  #     p "Those are invalid coordinates. Please try again:"
  #     get_coordinates
  #   end
  #   @board.place(ship, selected_coordinates)
  # end
  #
  # def get_computer_coordinates

  # end

# MAJOR WORK IN PROGRESS. THIS WOULD BE THE COMPUTER'S PLACEMENT OF THE SHIPS
# ALSO CURRENTLY HARDCODED
  # def computer_place_ship
  #   cruiser = Ship.new("Cruiser", 3)
  #   available_coordinates = @board
  #   selected_coordinates = []
  #
  #   selected_coordinates << available_coordinates.cells.keys.sample(cruiser.length)
  #   until @board.valid_placement?(cruiser, selected_coordinates) == true
  #     selected_coordinates = available_coordinates.cells.keys.sample(cruiser.length)
  #   end
  #   @board.place(cruiser, selected_coordinates)
  # end

  def computer_place_ship
    available_coordinates = @board.cells.keys
    selected_coordinates = []

    @ships.each do |ship|
      selected_coordinates << available_coordinates.sample(ship[0].length)
      # require 'pry'; binding.pry
      until @board.valid_placement?(ship[0], selected_coordinates.flatten) == true
        selected_coordinates = available_coordinates.sample(ship[0].length)
      end
      @board.place(ship, selected_coordinates)
      available_coordinates.delete(selected_coordinates)
    end
  end

end
