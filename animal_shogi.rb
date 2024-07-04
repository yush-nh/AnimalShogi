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
      display_view
      print @current_player == @first_player ? '先手: 入力してください > ' : '後手: 入力してください > '
      command = gets.chomp.split(',')

      unless valid_format?(command)
        puts '入力フォーマットが正しくありません。再度入力してください。'
        next
      end

      if handle_piece_action(command)
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

  def display_view
    display_player(@second_player)
    @board.display
    display_player(@first_player)
  end

  def display_player(player)
    print "#{player.role}:"
    player.pieces.each { |piece| print "#{piece} " }
    print "\n"
  end

  def handle_piece_action(command)
    success = false
    if command.size == 2
      success = @board.move_piece(command[0], command[1], @current_player)
    elsif command.size == 1
      success = @board.place_piece(command[0], @current_player)
    end

    success
  end

  def switch_player
    @current_player == @first_player ? @second_player : @first_player
  end

  def valid_format?(command)
    regexp = /^[A-C][1-4][LGCPElgcpe]$/
    if command.size == 2
      regexp.match?(command[0]) && regexp.match?(command[1])
    elsif command.size == 1
      regexp.match?(command[0])
    else
      false
    end
  end
end
