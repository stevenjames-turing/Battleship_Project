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


end
