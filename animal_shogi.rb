# frozen_string_literal: true

class AnimalShogi
  FIRST_PLAYER = 1
  SECOND_PLAYER = 2

  def run
    current_player = FIRST_PLAYER

    loop do
      print current_player == FIRST_PLAYER ? '先手: 入力してください > ' : '後手: 入力してください > '
      gets.chomp

      current_player = switch_player(current_player)
    end
  end

  private

  def switch_player(current_player)
    current_player == FIRST_PLAYER ? SECOND_PLAYER : FIRST_PLAYER
  end
end
