# Frozen_string_literal: true

require_relative 'classes/knight'

def knight_path(start_coords, end_coords)
  queue = [Knight.new(start_coords)]

  until queue.empty?
    knight = queue.shift

    return knight if knight.position == end_coords

    knight.calculate_possible_moves.each do |move|
      queue << Knight.new(move, knight)
    end
  end
end

def print_path(knight)
  path = []

  until knight.nil?
    path << knight.position
    knight = knight.parent
  end

  puts "You made it in #{path.size} moves !"
  puts 'Here is your path'
  path.reverse.each do |move|
    p move
  end
end

print_path(knight_path([0, 0], [6, 6]))
