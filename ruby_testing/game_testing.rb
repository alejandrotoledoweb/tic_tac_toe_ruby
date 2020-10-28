require './lib/game_class'
require './lib/class_board'
require './lib/set_up'

describe Game do
  let(:move) { [1, 2, 3, 4, 5, 6, 7, 8, 9] }
  let(:symbol) { 'X' }
  describe '#game_move' do
    it 'input on player and change with input' do
      expect(get_move.add(move, symbol)). to eql(%w[X X X X X X X X X])
    end
  end
end
