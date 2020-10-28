# spec/game_spec.rb

require '../lib/game_class'

describe Game do
  describe '#get_move' do
    it 'returns true if there is a valid choosen spot' do
      game = Game.new
      expect(game.get_move('1', 'X')).to eql(true)
    end

    it 'returns false if invalid move' do
      game = Game.new
      expect(game.get_move('s', 'X')).to eql(false)
    end
    describe '#winner_check' do
      it 'returns true if one condition is true' do
        game = Game.new
        game.get_move('1', 'X')
        game.get_move('2', 'X')
        game.get_move('3', 'X')
        expect(game.winner_check).to eql(true)
      end
      it 'returns false if combination is not valid' do
        game = Game.new
        expect(game.winner_check).to eql(nil)
      end
    end
  end
end
