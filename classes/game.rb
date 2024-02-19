# Frozen_string_literal: true

require_relative 'color'
require_relative 'board'

# A Chess game class
class Game
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

  def check_for_out_of_boundary(new_x, new_y)
    possible_steps << [new_x, new_y] if new_x > -1 && new_x < 8 && new_y > -1 && new_y < 8
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

    new_x = x + 2
    new_y = y + 1
    check_for_out_of_boundary(new_x, new_y)

    new_x = x + 2
    new_y = y - 1
    check_for_out_of_boundary(new_x, new_y)
  end

  def position_of_knight
    chess_board.board.each_with_index do |row, vertical_index|
      row.each_with_index do |square, horizontal_index|
        return [horizontal_index, vertical_index] if square.eql? '🐴'
      end
    end
  end

  def possible_moves
    base_x, base_y = position_of_knight
    p calculate_possible_moves(base_x, base_y)
  end
end