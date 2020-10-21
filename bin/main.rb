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

    if coin = 1
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

