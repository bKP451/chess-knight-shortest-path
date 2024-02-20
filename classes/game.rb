# Frozen_string_literal: true

require_relative 'color'
require_relative 'board'
require_relative '../modules/possible_moves_helper'
require_relative 'knight'

# A Chess game class
class Game
  include PossibleMovesHelper
  attr_accessor :chess_board, :possible_steps

  def initialize
    @chess_board = Board.new
    instructions
    @possible_steps = []
  end

  def instructions
    puts 'SHORTEST PATH FOR THE KNIGHT'.green
    puts "----------------------------\n\n".blue
    chess_board.show_board
  end
end
