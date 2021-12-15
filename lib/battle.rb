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
  end

  def start
    print %q"Welcome to BATTLESHIP
      Enter p to play. Enter q to quit.
      >>>"

      play_or_quit = gets.chomp.downcase

      if play_or_quit == "p"
        play_game
      else
        end_of_game_message
      end
    end
  end

  def play_game
    computer_place_ship
    player_place_ship
    render_boards_true
    until computer_health == 0 || player_health == 0
      take_turn
      render_boards
    end
    p "**********GAME OVER**********"
  end_of_game_message
  end

  def render_boards
    p "=============COMPUTER BOARD============="
    @computer_board.render
    p "=============PLAYER BOARD============="
    @player_board.render
  end

  def render_boards_true
    p "=============COMPUTER BOARD============="
    @computer_board.render
    p "=============PLAYER BOARD============="
    @player_board.render(true)
  end

  def take_turn
    p "Enter the coordinate for your shot:"
    get_shot_coordinate
    computer_take_shot
  end

  def computer_health
    total_health = 0
    @computer_ships.each do |ship|
      total_health += ship.health
    end
    return total_health
  end

  def player_health
    total_health = 0
    @player_ships.each do |ship|
      total_health += ship.health
    end
    return total_health
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
    coordinate = gets.chomp.upcase
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
    gets.chomp.upcase.split(" ")
  end

  def player_place_ship
    p "I have laid out my ships on the grid."
    p "You now need to lay out your two ships."
    p "The Cruiser is three units long and the Submarine is two units long."
    @player_board.render
    selected_coordinates = []
    @player_ships.each do |ship|
      p "Enter the squares for the #{ship.name} (#{ship.length} spaces):"
      unverified_coordinates = get_ship_coordinates
      unverified_coordinates.each do |coord|
        if @player_board.valid_coordinate?(coord) == true
          selected_coordinates << coord
        else
          p "Those are invalid coordinates. Please try again:"
        end
      end
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

  def end_of_game_message
         if computer_health == 0 ; p "You won!"
        elsif player_health == 0 ; p "I won!"
      else p "Thanks for all the fish! Have a great life. Bye!"
    end
end
