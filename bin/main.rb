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