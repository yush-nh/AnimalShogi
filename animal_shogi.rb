# frozen_string_literal: true

require_relative 'board'

class AnimalShogi
  FIRST_PLAYER = '先手'
  SECOND_PLAYER = '後手'

  def initialize
    @current_player = FIRST_PLAYER
    @board = Board.new
  end

  def run
    loop do
      @board.display
      print @current_player == FIRST_PLAYER ? '先手: 入力してください > ' : '後手: 入力してください > '
      command = gets.chomp.split(',')

      if @board.move_piece(command[0], command[1])
        break if @board.finished?

        @current_player = switch_player
      else
        puts '配置失敗、ターン据え置き'
      end
    end

    @board.display
    puts "ゲーム終了 #{@current_player}の勝利！"
  end

  private

  def switch_player
    @current_player == FIRST_PLAYER ? SECOND_PLAYER : FIRST_PLAYER
  end
end
