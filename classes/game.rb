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
    next_squares = [Knight.new(start_coords)]
    until next_squares.empty? || next_squares.any? { |square| square.position == end_coords }
      current_squares = next_squares
      next_squares = []
      current_squares.each do |square|
        square.calculate_possible_moves.each do |move|
          next_squares.push(Knight.new(move, square))
        end
      end
    end

    destinations = next_squares.select { |square| square.position == end_coords }
    paths = reconstruct_path(destinations)

    pretty_print(paths)
  end

  private

  def reconstruct_path(destinations)
    paths = []
    ascending_paths = []

    destinations.each do |current|
      path = []
      until current.nil?
        path << current.position
        current = current.parent
      end
      paths << path
    end

    paths.reverse.each do |step|
      ascending_paths << step
    end

    ascending_paths
  end

  def pretty_print(paths)

    paths.each_with_index do |path, index|
      puts "\nPath #{index + 1}:"
      path.each { |coords| puts coords.inspect }
    end
  end
end
