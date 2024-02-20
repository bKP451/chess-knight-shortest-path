# Frozen_string_literal: true

# Helpers for a knight's possible moves
module PossibleMovesHelper
  def calculate_possible_moves(x = @position[0], y = @position[1])
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

  def check_for_out_of_boundary(new_x, new_y)
    possible_steps << [new_x, new_y] if new_x > -1 && new_x < 8 && new_y > -1 && new_y < 8
    possible_steps
  end

  def position_of_knight
    chess_board.board.each_with_index do |row, vertical_index|
      row.each_with_index do |square, horizontal_index|
        return [horizontal_index, vertical_index] if square.eql? '🐴'
      end
    end
  end

  def knight_possible_moves
    base_x, base_y = position_of_knight
    calculate_possible_moves(base_x, base_y)
  end
end
