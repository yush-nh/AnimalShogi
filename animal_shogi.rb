# frozen_string_literal: true

require_relative 'board'
require_relative 'player'

class AnimalShogi
  def initialize
    @first_player = Player.new('先手')
    @second_player = Player.new('後手')
    @current_player = @first_player
    @board = Board.new
  end

  def run
    loop do
      @board.display
      print @current_player == @first_player ? '先手: 入力してください > ' : '後手: 入力してください > '
      command = gets.chomp.split(',')

      unless valid_format?(command)
        puts '入力フォーマットが正しくありません。再度入力してください。'
        next
      end

      if @board.move_piece(command[0], command[1], @current_player)
        break if @board.finished?

        @current_player = switch_player
      else
        puts '配置失敗、ターン据え置き'
      end
    end

    @board.display
    puts "ゲーム終了 #{@current_player.role}の勝利！"
  end

  private

  def switch_player
    @current_player == @first_player ? @second_player : @first_player
  end

  def valid_format?(command)
    regexp = /^[A-C][1-4][LGCPElgcpe]$/
    regexp.match?(command[0]) && regexp.match?(command[1])
  end
end
