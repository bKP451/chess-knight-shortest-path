# Frozen_string_literal: true

require_relative 'color'
require_relative 'board'

# A Chess game class
class Game
  attr_accessor :board, :possible_steps

  def initialize
    @board = Board.new
    instructions
    @possible_steps = []
  end

  def instructions
    puts 'SHORTEST PATH FOR THE KNIGHT'.green
    puts "----------------------------\n\n\n\n".blue
    board.show
  end

  def check_for_out_of_boundary(new_x, new_y)
    if new_x > -1 && new_x < 8 && new_y > -1 && new_y < 8
      puts "[#{new_x}][#{new_y}]"
      possible_steps << [new_x, new_y]
    end
    possible_steps
  end

  def calculate_possible_moves(x, y)
    new_x = x - 1
    new_y = y - 2
    check_for_out_of_boundary(new_x, new_y)

    new_x = x + 1
    new_y = y - 2
    check_for_out_of_boundary(new_x, new_y)

    new_x = x - 1
    new_y = y + 2
    check_for_out_of_boundary(new_x, new_y)

    new_x = x + 1
    new_y = y + 2
    check_for_out_of_boundary(new_x, new_y)

    new_x = x - 2
    new_y = y - 1
    check_for_out_of_boundary(new_x, new_y)

    new_x = x - 2
    new_y = y + 1
    check_for_out_of_boundary(new_x, new_y)
  end

  def possible_moves
    current_knight_position = [2, 2]
    base_x = 1
    base_y = 0
    calculate_possible_moves(base_x, base_y)
  end
end

knight_me = Game.new
p knight_me.possible_moves
