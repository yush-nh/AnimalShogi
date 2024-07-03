# frozen_string_literal: true

class Player
  attr_accessor :role
  attr_reader :pieces

  def initialize(role)
    @role = role
    @pieces = []
  end
end
