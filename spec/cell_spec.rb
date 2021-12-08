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
  end

  it '5* initializes not fired upon' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)

    expect(cell.fired_upon?).to be false
  end

  it '6* can be fired upon' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)
    expect(cell.fired_upon?).to be false

    cell.fire_upon

    expect(cell.ship.health).to eq(2)
    expect(cell.fired_upon?).to be true
  end

  it '7* will render not fired upon to begin' do
    cell_1 = Cell.new("B4")

    expect(cell_1.render).to eq(".")
  end

  it '8* can render "M" when fired upon and shot is a miss' do
    cell_1 = Cell.new("B4")

    expect(cell_1.render).to eq(".")

    cell_1.fire_upon

    expect(cell_1.render).to eq("M")
  end

  it '9* can render "H" when fired upon and shot is a hit' do
    cell_1 = Cell.new("B4")
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)

    cell_2.place_ship(cruiser)

    expect(cell_2.render).to eq(".")

    cell_2.fire_upon

    expect(cell_2.render).to eq("H")
    expect(cruiser.sunk?).to be false
  end

  it '10* can render "x" when fired upon and ship has sunk' do
    cell_1 = Cell.new("B4")
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)

    cell_2.place_ship(cruiser)

    expect(cell_2.render).to eq(".")

    cell_2.fire_upon

    expect(cell_2.render).to eq("H")
    expect(cruiser.sunk?).to be false

    cruiser.hit
    cruiser.hit

    expect(cruiser.sunk?).to be true
    expect(cell_2.render).to eq("X")
  end

  # it '11* can render "S" when given optional boolean' do
  #   cell_1 = Cell.new("B4")
  #   cell_2 = Cell.new("C3")
  #   cruiser = Ship.new("Cruiser", 3)
  #
  #   cell_2.place_ship(cruiser)
  #   expect(cell_2.render).to eq(".")
  #
  #   expect(cell_2.render(true)).to eq("S")
  # end

end
