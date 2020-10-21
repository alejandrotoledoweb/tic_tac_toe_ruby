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


class BeginRandom

  def coin_flip
    coin = rand(2)

    if coin == 1
      puts 'we get HEADS UP'
      return true
    else 
      puts 'we get TAILS'
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

class Game
  attr_accessor :active_board
  def initialize
    # @active_board = Board.new
  end
  
  def players_info
    puts "Player 1 type your name and symbol: "
    $player_1 = FirstSetup.new(gets.chomp, gets.chomp)
    puts "Player 2 type your name"
    $player_2 = FirstSetup.new(gets.chomp, gets.chomp)
  end
end 


