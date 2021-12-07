require './lib/cell'
require './lib/ship'

RSpec.describe Cell do
  it '1* it exists' do
    cell = Cell.new("B4")

    expect(cell).to be_instance_of(Cell)
  end
end 
