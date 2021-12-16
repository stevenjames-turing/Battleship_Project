require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/battle'


RSpec.describe Battle do
  it '1* exists' do
    battle = Battle.new

    expect(battle).to be_instance_of(Battle)
  end

  it '2* initializes with 2 Boards' do
    battle = Battle.new

    expect(battle.computer_board).to be_instance_of(Board)
    expect(battle.player_board).to be_instance_of(Board)
  end

  it '3* player board and computer board are different instances of Board' do
    battle = Battle.new

    expect(battle.computer_board).to be_instance_of(Board)
    expect(battle.player_board).to be_instance_of(Board)
    expect(battle.player_board == battle.computer_board).to be false
  end

  it '4* initializes with 2 ship arrays' do
    battle = Battle.new

    expect(battle.player_ships[0].name).to eq("Cruiser")
    expect(battle.player_ships[1].name).to eq("Submarine")
    expect(battle.computer_ships[0].name).to eq("Cruiser")
    expect(battle.computer_ships[1].name).to eq("Submarine")
  end

  it '5* computer ships and player ships are different instances of Ship' do
    battle = Battle.new

    expect(battle.player_ships.first).to be_instance_of Ship
    expect(battle.computer_ships.first).to be_instance_of Ship
    expect(battle.player_ships == battle.computer_ships).to be false

  end

  it '6* the computer can place ships on the board' do
    battle = Battle.new
    battle.computer_place_ship

    expected_result = nil
    cells_with_ships = []
    battle.computer_board.cells.values.each do |value|
      if value.empty? == false
        expected_result = true
        cells_with_ships << value
      end
    end

    expect(cells_with_ships.count).to eq(5)
    expect(expected_result).to be true
  end

  it '7* the computer can take shots on Player board' do
    battle = Battle.new

    battle.computer_take_shot

    cells_fired_upon = []
    battle.player_board.cells.values.each do |value|
      if value.fired_upon? == true
        cells_fired_upon << value
      end
    end

    expect(cells_fired_upon.count).to eq(1)
  end

  it '8* the computer can take multiple shots on Player board' do
    battle = Battle.new

    battle.computer_take_shot
    battle.computer_take_shot
    battle.computer_take_shot
    battle.computer_take_shot
    battle.computer_take_shot
    battle.computer_take_shot
    battle.computer_take_shot
    battle.computer_take_shot
    battle.computer_take_shot
    battle.computer_take_shot

    cells_fired_upon = []
    battle.player_board.cells.values.each do |value|
      if value.fired_upon? == true
        cells_fired_upon << value
      end
    end
    expect(cells_fired_upon.count).to eq(10)
  end

  it '9* can display the computers total health' do
    battle = Battle.new
    battle.computer_place_ship

    expect(battle.computer_health).to eq(5)
  end
end
