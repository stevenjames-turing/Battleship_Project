require '.lib/ship'

RSpec.descripe Ship do
  it '1* exists'
  cruiser = Ship.new("Cruiser", 3)
  expect(cruiser).to be_instance_of(Ship)
end
