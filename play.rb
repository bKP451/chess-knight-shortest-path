# Frozen_string_literal: true

require_relative 'classes/game'

knight_me = Game.new
initial_x = knight_me.chess_board.initial_knight_position_x
initial_y = knight_me.chess_board.initial_knight_position_y
input_square = [initial_x, initial_y]
knight_me.bfs(input_square, [7, 7])