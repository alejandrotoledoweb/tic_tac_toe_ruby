# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity
# rubocop:disable Metrics/AbcSize

# This is the Game Class
class Game
  attr_accessor :game_on
  attr_reader :cells, :winner, :draw

  def initialize
    @game_on = true
    @winner = false
    @draw = false
    @cells = %w[1 2 3 4 5 6 7 8 9]
  end

  def get_move(move, symbol)
    if cells.any? { |n| move == n } && move.to_i != 0
      cells[move.to_i - 1] = symbol
      true
    else
      puts 'spot already taken or not between 1~9, enter a valid number'
      sleep(0.8)
      false
    end
  end

  def winner_check
    @win1 = cells[0] == cells[1] && cells[1] == cells[2]
    @win2 = cells[3] == cells[4] && cells[4] == cells[5]
    @win3 = cells[6] == cells[7] && cells[7] == cells[8]
    @win4 = cells[0] == cells[4] && cells[4] == cells[8]
    @win5 = cells[2] == cells[4] && cells[4] == cells[6]
    @win6 = cells[0] == cells[3] && cells[3] == cells[6]
    @win7 = cells[1] == cells[4] && cells[4] == cells[7]
    @win8 = cells[2] == cells[5] && cells[5] == cells[8]

    @winner = true if @win1 || @win2 || @win3 || @win4 || @win5 || @win6 || @win7 || @win8
  end

  def draw_check
    @draw = true if cells.all? { |space| %w[X O].include? space }
  end
end

# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
# rubocop:enable Metrics/AbcSize
