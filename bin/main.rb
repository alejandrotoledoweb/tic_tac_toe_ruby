# For this game we need:
# - collect the players info
# - show the board in the terminal all the time
# - lets decide who is going to play first
# - we start a loop counting the number of moves for the two players, 
# - the loop works until we got a maximun of 9 moves and if anyone wins it's a draw
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
    puts "#{$current_player.name} you are first" if @turn == true
  end
end

# In this class we created a random number and choose who is going to play first
class BeginRandom

  def coin_flip
  
  end
end

# for this class we have the visual board that appears in the terminal with the symbols of each player
class Board
  
  def initialize
  
  end

  def display_board_game
   
  end

# in this method we check if the input of the player is inside the board and we replace it with the symbol of each player
  def choose_move
  
  end
end  

# in the Game class we have the FirstSetup class working and getting the info from the players
class Game
  
  def initialize
   
  end
  
  def players_info
   
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
