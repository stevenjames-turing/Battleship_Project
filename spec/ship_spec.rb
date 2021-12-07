require './lib/ship'

RSpec.describe Ship do
  it '1* exists' do
  cruiser = Ship.new("Cruiser", 3)
  expect(cruiser).to be_instance_of(Ship)
  end
end
