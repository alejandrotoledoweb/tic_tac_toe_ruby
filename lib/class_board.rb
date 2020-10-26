# this the display board methods
def display_board_game(arr)
  system 'clear'
  puts "  |  #{arr[6]}  |  #{arr[7]}  |  #{arr[8]}  |"
  puts '  |     |     |     |'
  puts "  |  #{arr[3]}  |  #{arr[4]}  |  #{arr[5]}  |"
  puts '  |     |     |     |'
  puts "  |  #{arr[0]}  |  #{arr[1]}  |  #{arr[2]}  |"
  puts '  |     |     |     |'
end
