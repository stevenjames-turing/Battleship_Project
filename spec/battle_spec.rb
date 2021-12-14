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

  it '3* the computer can place ships on the board' do
    battle = Battle.new
    battle.computer_place_ship
  end

  it '4* the player can place ships on the board' do
    battle = Battle.new
    # battle.computer_place_ship
    # battle.player_place_ship
  end

end
