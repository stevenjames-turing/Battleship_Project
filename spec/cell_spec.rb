require './lib/cell'
require './lib/ship'

RSpec.describe Cell do
  it '1* exists' do
    cell = Cell.new("B4")

    expect(cell).to be_instance_of(Cell)
  end

  it '2* has a coordinate' do
    cell = Cell.new("B4")

    expect(cell.coordinate).to eq("B4")
  end

  it '3* Cell initializes empty' do
    cell = Cell.new("B4")

    expect(cell.ship).to eq(nil)
    expect(cell.empty?).to be true
  end

  it '4* can have a Ship' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)

    expect(cell.ship).to be_instance_of(Ship)
    expect(cell.ship.name).to eq("Cruiser")
    expect(cell.empty?).to be false
    require 'pry'; binding.pry
  end


end
