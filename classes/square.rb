# Frozen_string_literal: true

require_relative '../modules/possible_moves_helper'

class Square
  include PossibleMovesHelper
  attr_reader :coords, :parent, :possible_steps

  def initialize(coords, parent = nil)
    @coords = coords
    @parent = parent
    @possible_steps = []
  end
end
