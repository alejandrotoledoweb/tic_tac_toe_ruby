# spec/game_spec.rb

require './lib/game_class'

# rubocop:disable Metrics/BlockLength
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
    describe '#draw_check' do
      it 'returns draw if board is not empty' do
        game = Game.new
        game.get_move('1', 'X')
        game.get_move('2', 'X')
        game.get_move('3', 'X')
        game.get_move('4', 'X')
        game.get_move('5', 'X')
        game.get_move('6', 'X')
        game.get_move('7', 'X')
        game.get_move('8', 'X')
        game.get_move('9', 'X')
        expect(game.draw_check).to eql(true)
      end
      it 'returns nil' do
        game = Game.new
        expect(game.draw_check).to eql(nil)
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength
