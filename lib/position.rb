# frozen_string_literal: true

class Position
  COL = %w[1 2 3 4].freeze
  ROW = %w[A B C].freeze

  attr_accessor :row, :col, :animal

  def initialize(command)
    @row = ROW.index(command[0])
    @col = COL.index(command[1])
    @animal = command[2]
  end

  def out_of_board?
    !((0..3).cover?(@col) && (0..2).cover?(@row))
  end
end
