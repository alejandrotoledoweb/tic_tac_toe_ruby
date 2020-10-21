# For this game we need:
# - collect the players info
# - show the board in the terminal all the time
# - lets decide who is going to play first
# - we start a loop counting the number of moves for the two players, until we got a maximun of 9 moves and if anyone wins it's a draw
# - ask for a spot in the board for the first player
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
    if @turn == true
      puts "#{self.name} you are first"
  end
end

# In this class we created a random number and choose who is going to play first
class BeginRandom

  def coin_flip
    coin = rand(2)

    if coin == 1
      puts "we get HEADS UP"
      return true
    else 
      puts "we get TAILS"
      return false
    end  
  end
end

# for this class we have the visual board that appears in the terminal with the symbols of each player
class Board
  attr_accessor :cells
  @cells = []

  def initialize
    @cells = [[" ", " ", " "],[" ", " ", " "],[" ", " ", " "]]
  end

  def display_board_game
    puts "  |‾‾‾‾‾|‾‾‾‾‾|‾‾‾‾‾|"
    puts "  |  #{@cells[0][0]}  |  #{@cells[0][1]}  |  #{@cells[0][2]}  |"
    puts "  |7_____|8_____|9_____|"
    puts "  |      |      |      |"
    puts "  |  #{@cells[1][0]}  |  #{@cells[1][1]}  |  #{@cells[1][2]}  |"
    puts "  |4_____|5_____|6_____|"
    puts "  |      |      |      |"
    puts "  |  #{@cells[2][0]}  |  #{@cells[2][1]}  |  #{@cells[2][2]}  |"
    puts "  |1_____|2_____|3_____|"
    puts ""
  end  
end

# in this method we check if the input of the player is inside the board and we replace it with the symbol of each player
def choose_move
  case $chosen_move
  when 1
    if @cells[2][0].empty?
      @cells[2][0] = "#{$current_player.symbol}" 
    else 
      return "Choose another cell"
    end
  when 2 
    if @cells[2][1].empty?
      @cells[2][1] = "#{$current_player.symbol}" 
    else
      return "Choose another cell"
    end
  when 3
    if @cells[2][2].empty?
      @cells[2][2] = "#{$current_player.symbol}" 
      else 
      return "Choose another cell"
    end
  when 4
    if @cells[1][0].empty?
      @cells[1][0] = "#{$current_player.symbol}" 
    else 
      return "Choose another cell"
    end
  when 5
    if @cells[1][1].empty?
      @cells[1][1] = "#{$current_player.symbol}" 
    else 
      return "Choose another cell"
    end
when 6
if @cells[1][2].empty?
  @cells[1][2] = "#{$current_player.symbol}" 
else 
  return "Choose another cell"
end
when 7
if @cells[0][0].empty?
  @cells[0][0] = "#{$current_player.symbol}" 
else 
  return "Choose another cell"
end
when 8
if @cells[0][1].empty?
  @cells[0][1] = "#{$current_player.symbol}" 
else 
  return "Choose another cell"
end
when 9
if @cells[0][2].empty?
  @cells[0][2] = "#{$current_player.symbol}" 
else 
  return "Choose another cell"
end
end
end
end

# in the Game class we have the FirstSetup class working and getting the info from the players
class Game
  attr_accessor :active_board
  def initialize
    # @active_board = Board.new
  end
  
  def players_info
    puts "Welcome to our tic tac toe game!"
    puts "Player 1 type your name, type enter and enter you symbol: "
    $player_1 = FirstSetup.new(gets.chomp, gets.chomp)
    puts "Welcome #{$player_1.name}, you are the first player, and you symbol is '#{$player_1.symbol}'"
    puts "Player 2 type your name, type enter and type symbol: "
    $player_2 = FirstSetup.new(gets.chomp, gets.chomp)
    puts "Welcome #{$player_2.name}, you are the second player, and you symbol is '#{$player_2.symbol}'"
    puts "Let's decide who is going first, let's flip a coin. press enter"
    puts "#{$player_1.name}, you're HEADS. #{$player_2.name}, you're TAILS."
    gets
    flip = BeginRandom.new
    $player_1.turn = flip.coin_flip
    $player_2.turn = !player_1.turn
    $player_1.first_turn
    $player_2.first_turn
  end

  # this method is goin to join all other methods and make the game works

  def play_game
    
  end

  # this method check if player_1 or player_2 is typing
  def check_player_turns
    
  end

  # this method check all the possible matches to win the game every time a player input a number
  def check_winner
    
  end

  # this method displays a message if there is a winner
  def final_game
    
  end
end 


# those lines are for calling the methods and runs the code in terminal
play = Game.new
play.players_info