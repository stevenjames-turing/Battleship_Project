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

  xit '3* Deck object has health eq to length' do
  cruiser = Ship.new("Cruiser", 3)
  expect(cruiser).to be_instance_of(Ship)
  end

  xit '2* Deck object starts with sunk eq false' do
  cruiser = Ship.new("Cruiser", 3)
  expect(cruiser).to be_instance_of(Ship)
  end
end
