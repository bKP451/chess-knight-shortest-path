# Frozen_string_literal: true

require_relative '../modules/possible_moves_helper'

class Knight
  include PossibleMovesHelper
  attr_accessor :position, :parent, :possible_steps

  def initialize(initial_square, parent = nil)
    @position = initial_square
    @parent = parent
    @possible_steps = []
  end
end
