# spec/game_spec.rb

require '../lib/game_class'

describe Game do
  describe '#get_move' do
    it 'returns true if there is a valid choosen spot' do
      game = Game.new
      expect(game.get_move('1', 'X')).to eql(true)
    end
  end
end
