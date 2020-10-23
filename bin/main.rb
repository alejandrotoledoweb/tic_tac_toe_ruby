# rubocop:disable Style/ConditionalAssignment
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity
# rubocop:disable Metrics/AbcSize

# - collect the players info
# - show the board in the terminal all the time
# - lets decide who is going to play
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
    @turn = false
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

def display_board_game(arr)
  system 'clear'
  puts "  |  #{arr[6]}  |  #{arr[7]}  |  #{arr[8]}  |"
  puts '  |     |     |     |'
  puts "  |  #{arr[3]}  |  #{arr[4]}  |  #{arr[5]}  |"
  puts '  |     |     |     |'
  puts "  |  #{arr[0]}  |  #{arr[1]}  |  #{arr[2]}  |"
  puts '  |     |     |     |'
end

reset = true

while reset
  puts 'Welcome to our tic tac toe game!'
  p1_name = true
  p2_name = true

  while p1_name
    puts 'Player 1 type your name. '
    player1 = FirstSetup.new(gets.chomp, 'X')
    puts "Welcome #{player1.name.upcase!}, you are the first player, and you symbol is '#{player1.symbol}'"
    sleep(0.8)
    p1_name = false
  end

  while p2_name
    puts 'Player 2 type your name. '
    player2 = FirstSetup.new(gets.chomp, 'O')
    puts "Welcome #{player2.name.upcase!}, you are the second player, and you symbol is '#{player2.symbol}'"
    sleep(0.8)
    p2_name = false
  end

  game = Game.new

  while game.game_on
    display_board_game(game.cells)

    while player1.turn == false
      puts "#{player1.name.upcase} is your turn, choose a spot (number)"
      move1 = gets.chomp
      player1.turn = game.get_move(move1, player1.symbol)
      player2.turn = false
    end

    puts "#{player1.name} has selected #{move1}"
    display_board_game(game.cells)

    if game.winner
      puts "#{player1.name} is the winner"
      @game_on = false
      break
    end

    if game.draw
      puts 'It ended as a draw'
      game.game_on = false
      break
    end

    while player2.turn == false
      puts "#{player2.name} is your turn, choose a spot (number)"
      move2 = gets.chomp
      sleep(0.8)
      player2.turn = game.get_move(move2, player2.symbol)
      player1.turn = false
    end

    puts "#{player2.name} has selected #{move2}"
    display_board_game(game.cells)

    if game.winner
      puts "#{player2.name} is the winner"
      @game_on = false
      break
    end

    next unless game.draw

    puts "It's a draw"
    game.game_on = false
    next
  end

  puts "For PLAY AGAIN type 'yes' to END the game type any other key"
  p_again = gets.chomp
  if p_again == 'yes'
    reset = true
    game = Game.new
  else
    reset = false
    puts 'GAME OVER'
  end
end

# rubocop:enable Style/ConditionalAssignment
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
# rubocop:enable Metrics/AbcSize
