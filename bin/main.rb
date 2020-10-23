# rubocop:disable Style/RedundantSelf
# rubocop:disable Style/GlobalVars
# rubocop:disable Style/ConditionalAssignment
# rubocop:disable Lint/RedundantCopDisableDirective

# - collect the players info
# - show the board in the terminal all the time
# - lets decide who is going to play # rubocop:disable Style/WhileUntilDofirst
# - we start a loop counting the number of moves for the two players,
# - the loop works until we got a maximun of 9 moves and if anyone wins it's a draw
# - ask for a spot in the board for the player
# - check if that move is a valid move
# - check if that move was a winning or draw move,update the board with the player_1's symbol
# - change players turn
# - ask for a spot in the board for the second player
# - check if that move is a valid move
# - check if that move was a winning or draw move,update the board with the player_2's symbol
# - display if there is a winner or is a draw
# - end of the game


class FirstSetup
  attr_reader :name, :symbol
  attr_accessor :turn

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @turn = turn
  end

  def first_turn
    puts "#{$player_1.name} you are first" if $player_1.turn == true
  end
end

# This is Coin Section
def coin_flip
  coin = rand(2)
  if coin == 1
    puts 'we get HEADS UP'
    sleep(1.0)
    true
  else
    puts 'we get TAILS'
    sleep(1.0)
    false
  end
end

def display_board_game(arr)
  system 'clear'
  puts "  |  #{arr[6]}  |  #{arr[7]}  |  #{arr[8]}  |"
  puts '  |  7  |  8  |  9  |'
  puts "  |  #{arr[3]}  |  #{arr[4]}  |  #{arr[5]}  |"
  puts '  |  4  |  5  |  6  |'
  puts "  |  #{arr[0]}  |  #{arr[1]}  |  #{arr[2]}  |"
  puts '  |  1  |  2  |  3  |'
end

# this method check if player_1 or player_2 is typing
def check_player_turns
  if $player_1.turn == true
    $current_turn = $player_1
  else
    $current_turn = $player_2
  end
end

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
      false
    end
  end

  def winner
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

  def draw
    @draw = true if cells.all? { |space| %w[X O].include? space }
  end
end

puts 'Welcome to our tic tac toe game!'
puts 'Player 1 type your name, type enter and enter you symbol: '
player_1 = FirstSetup.new(gets.chomp, 'X')
puts "Welcome #{player_1.name}.upercase, you are the first player, and you symbol is '#{player_1.symbol}'"
puts 'Player 2 type your name, type enter and type symbol: '
player_2 = FirstSetup.new(gets.chomp, 'O')
puts "Welcome #{player_2.name}, you are the second player, and you symbol is '#{player_2.symbol}'"
puts "Let's decide who is going first, let's flip a coin. press enter"
puts "#{$player_1.name}, you're HEADS. #{$player_2.name}, you're TAILS."
gets
if coin_flip == true
  puts "#{$player_1.name} is your turn"
else
  puts "#{$player_2.name} is your turn"
end

game = Game.new

while game.game_on
  display_board_game(game.cells)
  check_player_turns
  puts "#{$current_turn.name}, choose available spot (number) to play"
  input_spot = choose_spot.new
  input_spot = gets.chomp.to_i
  puts "Your move is #{$chosen_move}"
  
  draw_move
  winner_next_move
end
active_board.display_board_game
active_board.display_board_game_1
puts 'this ended as a draw' if i == 9




# rubocop:enable Style/RedundantSelf
# rubocop:enable Style/GlobalVars
# rubocop:enable Style/ConditionalAssignment
# rubocop:enable Lint/RedundantCopDisableDirective
