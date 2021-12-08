require './lib/cell'
require './lib/ship'
require './lib/board'

RSpec.describe Board do
  let (:board) {Board.new}
  # let (:) {}
  # let (:) {}
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




end
