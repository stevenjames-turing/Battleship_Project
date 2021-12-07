require 'pry'
require './lib/ship'

RSpec.describe Ship do
  it '1* exists' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser).to be_instance_of(Ship)
    end

  it '2* Ship object has a name' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser.name).to eq("Cruiser")
  end

  it '3* Ship object has health eq to length' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser.length).to eq(3)
    expect(cruiser.health).to eq(3)
    expect(cruiser.health).to eq(cruiser.length)
  end

  it '4* Ship object starts with sunk eq false' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser.sunk?).to be false
  end

  it '5* when hit Deck health reduces by -1' do
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit

    expect(cruiser.health).to eq(2)
  end

  it '6* sinks when health == 0' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.health).to eq(3)

    cruiser.hit
    cruiser.hit

    expect(cruiser.health).to eq(1)
    expect(cruiser.length).to eq(3)
    expect(cruiser.sunk?).to be false

    cruiser.hit

    expect(cruiser.health).to eq(0)
    expect(cruiser.sunk?).to be true
  end
end
