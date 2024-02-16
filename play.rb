# Frozen_string_literal: true

require_relative 'color'
require_relative 'board'

puts 'SHORTEST PATH FOR THE KNIGHT'.green
puts "----------------------------\n\n\n\n".blue

continue_playing = 'Y'

def show_board
  chess_board = Board.new
  chess_board.show
end

until continue_playing.eql? 'N'
  show_board
  puts "\n\nWhere do you want to keep the knight 🐴 ?"
  puts 'Press any key except N/n to play again'.brown
  continue_playing = gets.chomp.upcase
end