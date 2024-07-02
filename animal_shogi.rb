# frozen_string_literal: true

require_relative './lib/board'

class AnimalShogi
  include Board

  FIRST_PLAYER = 1
  SECOND_PLAYER = 2

  def initialize
    @current_player = FIRST_PLAYER
    @board = build_board
  end

  def run
    loop do
      display_board(@board)
      print @current_player == FIRST_PLAYER ? '先手: 入力してください > ' : '後手: 入力してください > '
      command = gets.chomp.split(',')
      move_piece(@board, command[0], command[1])

      @current_player = switch_player
    end
  end

  private

  def switch_player
    @current_player == FIRST_PLAYER ? SECOND_PLAYER : FIRST_PLAYER
  end
end
