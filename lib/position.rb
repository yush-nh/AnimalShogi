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
end
