require './lib/cell'
require './lib/ship'
require './lib/board'

RSpec.describe Board do
  let (:board) {Board.new}
  let (:cruiser) {Ship.new("Cruiser", 3)}
  let (:submarine) {Ship.new("Submarine", 2)}
  # let (:) {}
  it '1* exists' do
    # board = Board.new
    expect(board).to be_instance_of(Board)
  end

  it '2* has cells' do
    # board = Board.new

    expect(board.cells.keys).to eq(["A1","A2","A3","A4","B1","B2","B3","B4","C1","C2","C3","C4","D1","D2","D3","D4"])
    expect(board.cells.keys.count).to eq(16)
    expect(board.cells["A1"]).to be_instance_of(Cell)
  end

  it '3* cells have valid coordinates' do
    # board = Board.new

  expect(board.valid_coordinate?("A1")).to be true
  expect(board.valid_coordinate?("D4")).to be true
  expect(board.valid_coordinate?("A5")).to be false
  expect(board.valid_coordinate?("E1")).to be false
  expect(board.valid_coordinate?("A22")).to be false
  end

  # it '4* a valid Ship placement must be same length as Ship' do
  #
  #   expect(board.valid_placement?(cruiser, ["A1", "A2"])).to be false
  #   expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to be false
  # end

  # it '5* a valid Ship placement must be in consecutive cells' do
  #
  #   expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to be false
  #   require 'pry'; binding.pry
  #   expect(board.valid_placement?(cruiser, ["A1", "A2", "A3"])).to be true
  #   expect(board.valid_placement?(submarine, ["A1", "C1"])).to be false
  #   expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to be false
  #   expect(board.valid_placement?(submarine, ["C1", "B1"])).to be false
  # end

  # it '6* a valid Ship placement cannot be diagonal' do
  #   expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to be false
  #   expect(board.valid_placement?(submarine, ["C2", "D3"])).to be false
  # end
  #
  # it '7* a valid Ship placement must pass all validity tests' do
  #   expect(board.valid_placement?(submarine, ["A1", "A2"])).to be true
  #   expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to be true
  # end

  it '8* can place ships' do
    board.place(cruiser, ["A1", "A2", "A3"])
    board.place(submarine, ["A1", "B1"])

    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]

    expect(cell_1.ship.name).to eq("Cruiser")
    expect(cell_2.ship.name).to eq("Cruiser")
    expect(cell_3.ship.name).to eq("Cruiser")
    expect(cell_3.ship).to eq(cell_2.ship)
  end

  # it '9* cannot have overlapping ships' do
  #   board.place(cruiser, ["A1", "A2", "A3"])
  #
  #   # expect(board.valid_placement?(cruiser, ["A1", "A2", "A3"])).to be true
  #
  #   board.place(submarine, ["A1", "B1"])
  #
  #   # expect(board.valid_placement?(submarine, ["A1", "B1"])).to be false
  # end

  
end
