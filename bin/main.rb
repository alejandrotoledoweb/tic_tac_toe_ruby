# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity
# rubocop:disable Style/RedundantSelf
# rubocop:disable Metrics/AbcSize
# rubocop:disable Style/GlobalVars
# rubocop:disable Lint/RedundantCopDisableDirective
# rubocop:disable Style/ConditionalAssignment
# rubocop:disable Style/WhileUntilDo
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
class BeginRandom
  def coin_flip
    coin = rand(2)

    if coin == 1
      puts 'we get HEADS UP'
      true
    else
      puts 'we get TAILS'
      false
    end
  end
end

# This is Class Board
class Board
  attr_accessor :cells

  @cells = []

  def initialize
    @cells = [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]
  end

  # rubocop:disable Metrics/MethodLength
  def display_board_game
    system 'clear'
    puts '  |‾‾‾‾‾|‾‾‾‾‾|‾‾‾‾‾|'
    puts "  |  #{@cells[0][0]}  |  #{@cells[0][1]}  |  #{@cells[0][2]}  |"
    puts '  |7____|8____|9____|'
    puts '  |     |     |     |'
    puts "  |  #{@cells[1][0]}  |  #{@cells[1][1]}  |  #{@cells[1][2]}  |"
    puts '  |4____|5____|6____|'
    puts '  |     |     |     |'
    puts "  |  #{@cells[2][0]}  |  #{@cells[2][1]}  |  #{@cells[2][2]}  |"
    puts '  |1____|2____|3____|'
    puts ''
  end
  # rubocop:enableMetrics/MethodLength

  # rubocop:disable Metrics/MethodLength
  def choose_spot
    case $chosen_move
    when 1
      if @cells[2][0] == ' '
        @cells[2][0] = $current_turn.symbol.to_s
      else
        '/'
      end
    when 2
      if @cells[2][1] == ' '
        @cells[2][1] = $current_turn.symbol.to_s
      else
        '/'
      end
    when 3
      if @cells[2][2] == ' '
        @cells[2][2] = $current_turn.symbol.to_s
      else
        '/'
      end
    when 4
      if @cells[1][0] == ' '
        @cells[1][0] = $current_turn.symbol.to_s
      else
        '/'
      end
    when 5
      if @cells[1][1] == ' '
        @cells[1][1] = $current_turn.symbol.to_s
      else
        '/'
      end
    when 6
      if @cells[1][2] == ' '
        @cells[1][2] = $current_turn.symbol.to_s
      else
        '/'
      end
    when 7
      if @cells[0][0] == ' '
        @cells[0][0] = $current_turn.symbol.to_s
      else
        '/'
      end
    when 8
      if @cells[0][1] == ' '
        @cells[0][1] = $current_turn.symbol.to_s
      else
        '/'
      end
    when 9
      if @cells[0][2] == ' '
        @cells[0][2] = $current_turn.symbol.to_s
      else
        '/'
      end
    end
  end
end

# This is the Game Class
class Game
  attr_accessor :active_board

  def initialize
    @active_board = Board.new
  end

  def players_info
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
    flip = BeginRandom.new
    $player_1.turn = flip.coin_flip
    $player_2.turn = !$player_1.turn
    $player_1.first_turn
    $player_2.first_turn
    gets
  end

  # this method is goin to join all other methods and make the game works

  # rubocop:disable Metrics/MethodLength
  def play_game
    i = 0
    while i < 9 do
      @active_board.display_board_game
      check_player_turns
      puts "#{$current_turn.name}, choose available spot (number) to play"
      $chosen_move = gets.chomp.to_i
      puts "Your move is #{$chosen_move}"
      unless (1..9).include?($chosen_move)
        puts 'You have to choose a number between 1 - 9'
        sleep(0.7)
        redo
      end
      if active_board.choose_spot == '/'
        puts 'You have to choose another spot'
        sleep(0.7)
        redo
      end
      @active_board.choose_spot
      $player_1.turn = !$player_1.turn
      $player_2.turn = !$player_2.turn
      break if self.check_winner == '/'

      i += 1
      puts 'the next move is a draw' if i == 7
      sleep(1.5)
      puts 'THE WINNER IS PLAYER 1' if i == 8
      sleep(1.5)
    end
    active_board.display_board_game
    puts 'this ended as a draw' if i == 9
  end
  # rubocop:enable Metrics/MethodLength

  # this method check if player_1 or player_2 is typing
  def check_player_turns
    if $player_1.turn == true
      $current_turn = $player_1
    else
      $current_turn = $player_2
    end
  end

  # this method check all the possible matches to win the game every time a player input a number
  # rubocop:disable Metrics/MethodLength
  def check_winner
  end
  # rubocop:enable Metrics/MethodLength

  # this method displays a message if there is a winner
  def game_over
    puts "GAME OVER! #{$current_turn.name} wins!"
    gets
    0
  end
end

# those lines are for calling the methods and runs the code in terminal
play = Game.new
play.players_info
play.play_game

# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
# rubocop:enable Style/RedundantSelf
# rubocop:enable Metrics/AbcSize
# rubocop:enable Style/GlobalVars
# rubocop:enable Lint/RedundantCopDisableDirective
# rubocop:enable Style/ConditionalAssignment
# rubocop:enable Style/WhileUntilDo
# rubocop:enable Lint/RedundantCopDisableDirective
