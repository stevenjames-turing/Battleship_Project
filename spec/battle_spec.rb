require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/battle'

RSpec.describe Battle do
  it '1* exists' do
    battle = Battle.new

    expect(battle).to be_instance_of(Battle)
  end

  it '2* initializes with a Board' do
    battle = Battle.new

    expect(battle.board).to be_instance_of(Board)
  end
end
