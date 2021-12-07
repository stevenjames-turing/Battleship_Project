require 'pry'
require './lib/ship'

RSpec.describe Ship do
  it '1* exists' do
  cruiser = Ship.new("Cruiser", 3)
  expect(cruiser).to be_instance_of(Ship)
  end

  it '2* Deck object has a name' do
  cruiser = Ship.new("Cruiser", 3)
  expect(cruiser.length).to eq(3)
  end

  it '3* Deck object has health eq to length' do
  cruiser = Ship.new("Cruiser", 3)
  expect(cruiser.health).to eq(cruiser.length)
  end

  it '4* Deck object starts with sunk eq false' do
  cruiser = Ship.new("Cruiser", 3)
  expect(cruiser.sunk?).to be false
  end

  it '5* when hit Deck health reduces by -1' do
  cruiser = Ship.new("Cruiser", 3)
  cruiser.hit
  expect(cruiser.hits).to eq(1)
  expect(cruiser.health).to eq(2)
  end
end
