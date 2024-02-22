# Frozen_string_literal: true

# Chess Board
class Board
  attr_accessor :rows, :columns, :initial_knight_position_x, :initial_knight_position_y, :board_count, :board

  def initialize
    @rows = 8
    @columns = 8
    @initial_knight_position_x = 1
    @initial_knight_position_y = 2
    @board = Array.new(8) { Array.new(8) }
    @board_count = 0
  end

  def populate_board(column, row)
    if board_count.even?
      board[row][column] = '⬜'
    else
      board[row][column] = '⬛'
    end
  end

  def reverse_colors(row_number)
    if row_number.even?
      @board_count = 1
    else
      @board_count = 0
    end
  end

  def fill_up_board
    rows.times do |r|
      columns.times do |j|
        if j == initial_knight_position_x && r == initial_knight_position_y
          board[initial_knight_position_x][initial_knight_position_y] = '🐴'
        else
          board[j][r] = populate_board(j, r)
        end
        @board_count += 1
      end
      reverse_colors(r)
    end
    board
  end

  def show_board
    chess_board = fill_up_board
    chess_board.each do |row|
      print "#{row} \n"
    end
  end
end
