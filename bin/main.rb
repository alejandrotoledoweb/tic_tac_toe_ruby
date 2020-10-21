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
end

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

class Board
  attr_accessor :cells
  @cells = []

  def initialize
    @cells = [[" ", " ", " "],[" ", " ", " "],[" ", " ", " "]]
  end

  def display_board_game
    system "clear"
    puts "  |‾‾‾‾‾|‾‾‾‾‾|‾‾‾‾‾|"
    puts "  |  #{@cells[0][0]}  |  #{@cells[0][1]}  |  #{@cells[0][2]}  |"
    puts "  |7____|8____|9____|"
    puts "  |     |     |     |"
    puts "  |  #{@cells[1][0]}  |  #{@cells[1][1]}  |  #{@cells[1][2]}  |"
    puts "  |4____|5____|6____|"
    puts "  |     |     |     |"
    puts "  |  #{@cells[2][0]}  |  #{@cells[2][1]}  |  #{@cells[2][2]}  |"
    puts "  |1____|2____|3____|"
    puts ""
  end  

  def choose_spot
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

class Game
  attr_accessor :active_board
  def initialize
    @active_board = Board.new
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
    $player_2.turn = !$player_1.turn
    $player_1.first_turn
    $player_2.first_turn
    gets
  end

  # this method is goin to join all other methods and make the game works

  def play_game
    i = 0
    while i < 9 do
      @active_board.display_board_game
      check_player_turns
      puts "#{$current_turn.name}, choose a spot (number) to play"
      $chosen_move = gets.chomp.to_i
      if !(1..9).include?($chosen_move)
        puts "You hace to choose a number between 1 - 9"
        redo
      end
      if active_board.choose_spot == 0
        puts "You have to choose another spot"
        redo
      end
      active_board.choose_spot
      $player_1.turn = !$player_1.turn
      $player_2.turn = !$player_2.turn
      break if self.check_winner == 0
      i += 1
    end
    active_board.display_board_game
    puts "this ended as a draw" if i == 9
  end  



  # this method check if player_1 or player_2 is typing
  def check_player_turns
    if $player_1.turn == true
      $current_turn = $player_1
    else 
      $current_turn = $player_2 
    end   
  end

  # this method check all the possible matches to win the game every time a player input a number
  def check_winner
    if( ( active_board.cells[2][0] == active_board.cells[2][1]) && ( active_board.cells[2][0] ==  active_board.cells[2][2]) && ( active_board.cells[2][1] ==  active_board.cells[2][2]) && active_board.cells[2][0] != " " && active_board.cells[2][1] != " " && active_board.cells[2][2] != " " )
      active_board.display_board_game
      game_over
    elsif (( active_board.cells[1][0] ==  active_board.cells[1][1]) && ( active_board.cells[1][0] ==  active_board.cells[1][2]) && ( active_board.cells[1][1] ==  active_board.cells[1][2]) && active_board.cells[1][1] != " " && active_board.cells[1][0] != " " && active_board.cells[1][2] != " " )
      active_board.display_board_game
      game_over
    elsif (( active_board.ells[0][0] ==  active_board.cells[0][1]) && ( active_board.cells[0][0] ==  active_board.cells[0][2]) && ( active_board.cells[0][1] ==  active_board.cells[0][2]) && active_board.cells[0][1] != " " && active_board.cells[0][0] != " " && active_board.cells[0][2] != " " )
      active_board.display_board_game
      game_over
    elsif (( active_board.cells[2][0] ==  active_board.cells[1][0]) && ( active_board.cells[2][0] ==  active_board.cells[0][0]) && ( active_board.cells[1][0] ==  active_board.cells[0][0]) && active_board.cells[2][0] != " " && active_board.cells[1][0] != " " && active_board.cells[0][0] != " " )
      active_board.display_board_game
      game_over
    elsif (( active_board.cells[2][1] ==  active_board.cells[1][1]) && ( active_board.cells[2][1] ==  active_board.cells[0][1]) && ( active_board.cells[1][1] ==  active_board.cells[0][1]) && active_board.cells[2][1] != " " && active_board.cells[1][1] != " " && active_board.cells[0][1] != " ") 
      active_board.display_board_game
      game_over
    elsif (( active_board.cells[2][2] ==  active_board.cells[1][2]) && ( active_board.cells[2][2] ==  active_board.cells[0][2]) && ( active_board.cells[1][2] ==  active_board.cells[0][2]) && active_board.cells[1][2] != " " && active_board.cells[2][2] != " " && active_board.cells[0][2] != " " )
      active_board.display_board_game
      game_over
    elsif (( active_board.cells[2][0] ==  active_board.cells[1][1]) && ( active_board.cells[2][0] ==  active_board.cells[0][2]) && ( active_board.cells[1][1] ==  active_board.cells[0][2]) && active_board.cells[1][1] != " " && active_board.cells[2][0] != " " && active_board.cells[0][2] != " " )
      active_board.display_board_game
      game_over
    elsif (( active_board.cells[0][0] =  active_board.cells[1][1]) && ( active_board.cells[0][0] ==  active_board.cells[2][2]) && ( active_board.cells[1][1] ==  active_board.cells[2][2]) && active_board.cells[1][1] != " " && active_board.cells[0][0] != " "  && active_board.cells[2][2] != " ") 
      active_board.display_board_game
      game_over
    end
  end  

 

  # this method displays a message if there is a winner
  def game_over
    puts "GAME OVER! #{$current_turn.name} wins!"
    gets
    return 0
  end
end 


# those lines are for calling the methods and runs the code in terminal
play = Game.new
play.players_info
play.play_game
