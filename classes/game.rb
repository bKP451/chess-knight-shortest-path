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

  def bfs(start_coords, end_coords)
    queue = [Knight.new(start_coords)]
    until queue.empty?
      knight = queue.shift
      return knight if knight.position == end_coords

      knight.calculate_possible_moves.each do |move|
        queue.push(Knight.new(move, knight))
      end
    end
  end

  def show_traversal_path(start_coords, end_coords)
    knight = bfs(start_coords, end_coords)
    path = []

    until knight.nil?
      path << knight.position
      knight = knight.parent
    end

    puts "The traversal path is #{path.size} moves"
    path.reverse.each do |step|
      p step
    end
  end
end
