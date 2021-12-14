require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/battle'


RSpec.describe Battle do
  it '1* exists' do
    battle = Battle.new
    # require 'pry'; binding.pry
    expect(battle).to be_instance_of(Battle)
  end

  it '2* initializes with 2 Boards' do
    battle = Battle.new

    expect(battle.computer_board).to be_instance_of(Board)
    expect(battle.player_board).to be_instance_of(Board)
  end

  it '3* initializes with 2 ship arrays' do
    battle = Battle.new

    expect(battle.player_ships[0].name).to eq("Cruiser")
    expect(battle.player_ships[1].name).to eq("Submarine")
    expect(battle.computer_ships[0].name).to eq("Cruiser")
    expect(battle.computer_ships[1].name).to eq("Submarine")
  end

  it '4* the computer can place ships on the board' do
    battle = Battle.new
    battle.computer_place_ship
  end

  it '5* the player can place ships on the board' do
    battle = Battle.new
    # battle.computer_place_ship
    # battle.player_place_ship
  end

end
