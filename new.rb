# Frozen_string_literal: true

require_relative 'classes/square'
class KnightPathFinder
  def knight_moves(starting_square, destination_square)
    next_squares = [Square.new(starting_square)]
    until next_squares.any? { |square| square.coords == destination_square }
      current_squares = next_squares
      next_squares = []
      current_squares.each do |square|
        square.calculate_possible_moves.each do |next_square|
          next_squares << Square.new(next_square, square)
        end
      end
    end

    destinations = next_squares.select { |square| square.coords == destination_square }
    paths = reconstruct_path(destinations)

    pretty_print(paths)
  end

  private

  def reconstruct_path(destinations)
    paths = []

    destinations.each do |current|
      path = []

      while current
        path.unshift(current.coords)
        current = current.parent
      end
      paths << path
    end

    paths
  end

  def pretty_print(paths)

    paths.each_with_index do |path, index|
      puts "\nPath #{index + 1}:"
      path.each { |coords| puts coords.inspect }
    end
  end
end


new_me = KnightPathFinder.new
new_me.knight_moves([0, 0], [0, 7])

