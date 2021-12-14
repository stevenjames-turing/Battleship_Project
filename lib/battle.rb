class Battle
  attr_reader :computer_board, :player_board, :ships

  def initialize
    @computer_board = Board.new
    @player_board = Board.new
    @ships = get_starting_ships
  end

  def get_starting_ships
    available_ships = [cruiser = Ship.new("Cruiser", 3), submarine = Ship.new("Submarine", 2)]
    available_ships.sample(2)
  end

  def start
    p "Welcome to BATTLESHIP"
    p "Enter p to play. Enter q to quit."
    response = gets.chomp
    if response == "p"
      system "clear"
      computer_place_ship
      player_place_ship
      render_boards
    end
  end

  def render_boards
    p "=============COMPUTER BOARD============="
    @computer_board.render
    p "=============PLAYER BOARD============="
    @player_board.render(true)
    take_turn
  end

  def take_turn
    p "Enter the coordinate for your shot:"
    get_shot_coordinate
    computer_take_shot
    render_boards
  end
 # COMPUTER_TAKE_SHOT IS BROKEN. THE INPUT FOR "FIRE_UPON" NEEDS TO BE A STRING AND
 # ITS CURRENTLY A STRING INSIDE OF AN ARRAY.
  def computer_take_shot
    available_coordinates = []
    available_coordinates << @player_board.cells.keys.flatten
    shot_coordinate = available_coordinates.flatten.sample(1)
    until @player_board.valid_coordinate?(shot_coordinate) == true
      shot_coordinate = available_coordinates.flatten.sample(1)
    end
    @player_board.cells[shot_coordinate[0][0]].fire_upon
    if @player_board.cells[shot_coordinate[0][0]].empty == false
      p "My shot on #{shot_coordinate} was a hit."
    else
      p "My shot on #{shot_coordinate} was a miss."
    end
  end

  def get_shot_coordinate
    coordinate = gets.chomp
    until @computer_board.valid_coordinate?(coordinate) == true
      p "Please enter a valid coordinate:"
      coordinate = gets.chomp
    end
    @computer_board.cells[coordinate].fire_upon
    if @computer_board.cells[coordinate].empty? == false
      p "Your shot on #{coordinate} was a HIT!"
    else
      p "Your shot on #{coordinate} was a miss."
    end
  end

  def get_ship_coordinates
    gets.chomp.split(" ")
  end

  def player_place_ship
    p "I have laid out my ships on the grid."
    p "You now need to lay out your two ships."
    p "The Cruiser is three units long and the Submarine is two units long."
    @player_board.render
    @ships.each do |ship|
      p "Enter the squares for the #{ship.name} (#{ship.length} spaces):"
      selected_coordinates = get_ship_coordinates
      until @player_board.valid_placement?(ship, selected_coordinates) == true
        p "Those are invalid coordinates. Please try again:"
        selected_coordinates = get_ship_coordinates
      end
      @player_board.place(ship, selected_coordinates)
    end
  end

  def computer_place_ship
    available_coordinates = @computer_board.cells.keys
    selected_coordinates = []

    @ships.each do |ship|
      selected_coordinates << available_coordinates.sample(ship.length)
      until @computer_board.valid_placement?(ship, selected_coordinates.flatten) == true
        selected_coordinates = available_coordinates.sample(ship.length)
      end
      @computer_board.place(ship, selected_coordinates)
      selected_coordinates.each do |coordinate|
        available_coordinates.delete(coordinate)
      end
    end
  end

  def test_runner
    @computer_board.render(true)
    @player_board.render(true)
  end
end
