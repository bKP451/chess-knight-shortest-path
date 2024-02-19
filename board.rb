# Frozen_string_literal: true

# Chess Board
class Board
  @@board_count = 0
  attr_accessor :rows, :columns, :initial_knight_position, :cell

  def initialize
    @rows = 8
    @columns = 8
    @initial_knight_position = [0][1]
    @cell = Array.new(8) { Array.new(2) }
  end

  def populated_cells(column, row)
    if column == 3 && row == 3
      cell[row][column] = '🐴'
    elsif @@board_count.even?
      cell[row][column] = '⬜'
    else
      cell[row][column] = '⬛'
    end
  end

  def reverse_colors(row_number)
    if row_number.even?
      @@board_count = 1
    else
      @@board_count = 0
    end
  end

  def show
    rows.times do |r|
      columns.times do |j|
        print populated_cells(j, r)
        @@board_count += 1
      end
      reverse_colors(r)
      puts
    end
  end
end

