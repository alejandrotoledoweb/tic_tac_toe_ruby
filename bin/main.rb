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


# This is Class Board
class Board
  attr_accessor :cells

  @cells = []

  def initialize
    @cells = [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]
  end

  def choose_spot
    case $chosen_move
    when 1
      @cells[2][0] == ' ' ? @cells[2][0] = $current_turn.symbol.to_s : '/'
    when 2
      @cells[2][1] == ' ' ? @cells[2][1] = $current_turn.symbol.to_s : '/'
    end
  end
end

def display_board_game(arr)
  system 'clear'
  puts "  |  #{arr[0][0]}  |  #{arr[0][1]}  |  #{arr[0][2]}  |"
  puts '  |  7  |  8  |  9  |'
  puts "  |  #{arr[1][0]}  |  #{arr[1][1]}  |  #{arr[1][2]}  |"
  puts '  |  4  |  5  |  6  |'
  puts "  |  #{arr[2][0]}  |  #{arr[2][1]}  |  #{arr[2][2]}  |"
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
  attr_reader :cells, :winner, :draw
  attr_accessor :game_on

  def initialize
    @game_on = true
    @winner = false
    @draw = false
    @cells = [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]
  end

  def it_include
    puts 'You have to choose a number between 1 - 9'
    sleep(0.7)
  end

  def change_player
    $player_1.turn = !$player_1.turn
    $player_2.turn = !$player_2.turn
  end

  def draw_move
    puts 'the next move is a draw' if $i == 7
    sleep(1.0)
  end

  def winner_next_move
    puts 'THE WINNER IS PLAYER 1' if $i == 8
    sleep(1.0)
  end

  # this method check all the possible matches to win the game every time a player input a number
  def check_winner
    puts ' '
  end

  # this method displays a message if there is a winner
  def game_over
    puts "GAME OVER! #{$current_turn.name} wins!"
    gets
    0
  end
end

puts 'Welcome to our tic tac toe game!'
puts 'Player 1 type your name, type enter and enter you symbol: '
$player_1 = FirstSetup.new(gets.chomp, gets.chomp)
puts "Welcome #{$player_1.name}, you are the first player, and you symbol is '#{$player_1.symbol}'"
puts 'Player 2 type your name, type enter and type symbol: '
$player_2 = FirstSetup.new(gets.chomp, gets.chomp)
puts "Welcome #{$player_2.name}, you are the second player, and you symbol is '#{$player_2.symbol}'"
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
  $chosen_move = gets.chomp.to_i
  puts "Your move is #{$chosen_move}"
  it_include unless (1..9).include?($chosen_move)

  if active_board.choose_spot == '/'
    puts 'You have to choose another spot'
    sleep(0.7)
    redo
  end
  @active_board.choose_spot
  change_player
  break if self.check_winner == '/'

  i += 1
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
