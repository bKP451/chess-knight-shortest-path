# Frozen_string_literal: true

# Chess Board
class Board
  attr_accessor :horizontal, :vertical, :knight_x, :knight_y, :board_count, :cell

  def initialize
    @horizontal = 8
    @vertical = 8
    @knight_x = 1
    @knight_y = 0
    @board_count = 0
    @cell = Array.new(8) { Array.new(8) }
  end

  def cell_content(x, y)
    if @board_count.even?
      cell[x][y] = "⬜ \t"
    else
      cell[x][y] = "⬛ \t"
    end

    cell[knight_x, knight_y] = "🐴 \t"
  end

  def reverse_colors(row_number)
    if row_number.even?
      board_count = 1
    else
      board_count = 0
    end
  end

  def show
    vertical.times do |i|
      horizontal.times do |j|
        print cell_content(i, j)
        @board_count += 1
      end
      reverse_colors(i)
      puts
    end
  end
end

bored_one = Board.new
bored_one.show