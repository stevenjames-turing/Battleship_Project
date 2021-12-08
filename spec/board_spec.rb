require './lib/cell'
require './lib/ship'
require './lib/board'

RSpec.describe Board do
  it '1* exists' do
    board = Board.new

    expect(board).to be_instance_of(Board)
  end

  it 'has cells' do
    board = Board.new

    expect(board.cells.keys).to eq(["A1","A2","A3","A4","B1","B2","B3","B4","C1","C2","C3","C4","D1","D2","D3","D4"])
    expect(board.cells["A1"]).to be_instance_of(Cell)
  end

  
end
