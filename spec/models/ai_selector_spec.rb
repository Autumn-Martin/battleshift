require 'rails_helper'

describe 'ai_space_selector' do
  it 'exists' do

    board = Board.new(2)
    ai = AiSpaceSelector.new(board)
    ai.fire!

    expect(ai).to be_a(AiSpaceSelector)
    expect(board.board_health).to eq(2)
  end
end
