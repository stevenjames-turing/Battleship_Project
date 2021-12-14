class Battle
  attr_reader :computer_board, :player_board, :player_ships, :computer_ships

  def initialize
    @computer_board = Board.new
    @player_board = Board.new
    @player_ships = get_starting_ships
    @computer_ships = get_starting_ships
  end

  def get_starting_ships
    available_ships = [cruiser = Ship.new("Cruiser", 3), submarine = Ship.new("Submarine", 2)]
    # available_ships.sample(2)
  end

  def start
    print %q"Welcome to BATTLESHIP
      Enter p to play. Enter q to quit.
      >>>"

      play_or_quit = gets.chomp

      if play_or_quit == "p"
        play_game
      elsif play_or_quit == "q"
        print "Thanks for all the fish! Hope to see you again. Bye!"
        # ***METHOD
      else print "Bye!"
      end
    end
  end

  def play_game
    computer_place_ship
    player_place_ship
    render_boards_true
    require pry; binding.pry
    until @computer_ships.health.all? == 0 || @player_ships.health.all? == 0
      take_turn
      render_boards
    end
  end

  def render_boards
    p "=============COMPUTER BOARD============="
    @computer_board.render
    p "=============PLAYER BOARD============="
    @player_board.render
    require 'pry'; binding.pry
    # take_turn
  end

  def render_boards_true
    p "=============COMPUTER BOARD============="
    @computer_board.render
    p "=============PLAYER BOARD============="
    @player_board.render(true)
    # take_turn
  end

  def take_turn
    p "Enter the coordinate for your shot:"
    get_shot_coordinate
    computer_take_shot
    # render_boards
  end

  def computer_take_shot
    available_coordinates = @player_board.cells.keys.flatten
    shot_coordinate = available_coordinates.sample(1)[0]
    until @player_board.valid_coordinate?(shot_coordinate) == true && @computer_board.cells[shot_coordinate].fired_upon? == false
      shot_coordinate = available_coordinates.sample(1)[0]
    end
    @player_board.cells[shot_coordinate].fire_upon
    if @player_board.cells[shot_coordinate].empty? == false && @player_board.cells[shot_coordinate].ship.sunk? == false
      p "My shot on #{shot_coordinate} was a hit."
    elsif @player_board.cells[shot_coordinate].empty? == false && @player_board.cells[shot_coordinate].ship.sunk? == true
      p "My shot on #{shot_coordinate} was a hit. I sunk your #{@player_board.cells[shot_coordinate].ship.name}."
    else
      p "My shot on #{shot_coordinate} was a miss."
    end
    available_coordinates.delete(shot_coordinate)
  end

  def get_shot_coordinate
    coordinate = gets.chomp
    until @computer_board.valid_coordinate?(coordinate) == true && @computer_board.cells[coordinate].fired_upon? == false
      p "Please enter a valid coordinate:"
      coordinate = gets.chomp
    end
    @computer_board.cells[coordinate].fire_upon
    system "clear"
    if @computer_board.cells[coordinate].empty? == false && @computer_board.cells[coordinate].ship.sunk? == false
      p "Your shot on #{coordinate} was a HIT!"
    elsif @computer_board.cells[coordinate].empty? == false && @computer_board.cells[coordinate].ship.sunk? == true
      p "Your shot on #{coordinate} was a HIT! You sunk my #{@computer_board.cells[coordinate].ship.name}!"
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
    @player_ships.each do |ship|
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

    @computer_ships.each do |ship|
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

battle = Battle.new
battle.start
# ____________________________________

# #    p "Welcome to BATTLESHIP"
#     p "Enter p to play. Enter q to quit."
#     response = gets.chomp
#     if response == "p"
#       system "clear"
# #     @board = Board.new
#     @ships = get_ships
#   end
#
#   def get_ships
#     @ships = []
#     @ships << Ship.new("Cruiser", 3)
#     @ships << Ship.new("Submarine", 2)
#     @ships << Ship.new("Carrier", 5)
#     @ships << Ship.new("Battleship", 4)
#     @ships << Ship.new("Destroyer", 2)
#     return @ships
#   end
#
# until ships
#   def get_coordinates
#     gets.chomp.split(" ")
#   end
#
# # Get's info from player and places Cruiser
# # ISSUES: Cruiser is hardcoded.
#   def player_place_cruiser
#     cruiser = Ship.new("Cruiser", 3)
#     selected_coordinates = get_coordinates
#
#     until @board.valid_placement?(cruiser, selected_coordinates) == true
#       p "Those are invalid coordinates. Please try again:"
#       get_coordinates
#     end
#     @board.place(cruiser, selected_coordinates)
#   end
#
#   # Get's info from player and places Submarine
#   # ISSUES: Submarine is hardcoded.
#   def player_place_submarine
#     submarine = Ship.new("Submarine", 2)
#     selected_coordinates = get_coordinates
#
#     until @board.valid_placement?(submarine, selected_coordinates) == true
#       p "Those are invalid coordinates. Please try again:"
#       get_coordinates
#     end
#     @board.place(submarine, selected_coordinates)
#   end
#
#   # THIS IS DESIGNED TO REPLACE THE HARDCODED SHIPS FOR THE PLAYER_PLACE METHOD
#   def player_place_ship(ship)
#     selected_coordinates = get_coordinates
#
#     until @board.valid_placement?(ship, selected_coordinates) == true
#       p "Those are invalid coordinates. Please try again:"
#       get_coordinates
#     end
#     @board.place(ship, selected_coordinates)
#   end
#
# # MAJOR WORK IN PROGRESS. THIS WOULD BE THE COMPUTER'S PLACEMENT OF THE SHIPS
# # ALSO CURRENTLY HARDCODED
#   def computer_place_cruiser
#     cruiser = Ship.new("Cruiser", 3)
#     available_coordinates = @board
#     selected_coordinates = []
#
#     selected_coordinates << available_coordinates.sample(cruiser.length)
#     until @board.valid_placement?
#   end
