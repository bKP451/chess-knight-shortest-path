# Frozen_string_literal: true

# Chess Board
class Board
  @@board_count = 0
  attr_accessor :rows, :columns, :board_count

  def initialize
    @rows = 8
    @columns = 8
  end

  def show
    rows.times do |r|
      columns.times do |j|
        if @@board_count.even? 
          print "⚪ \t"
        else 
          print "⚫ \t"
        end
        @@board_count += 1
      end
      if r.even?
        @@board_count = 1
      else
        @@board_count = 0
      end
      puts
    end
  end
end


