# frozen_string_literal: true

require 'debug'
require_relative './position'

module Board
  BLANK_CELL = ' '

  def build_board
    board = Array.new(4) { Array.new(3, BLANK_CELL) }
    board[0][0] = 'e'
    board[0][1] = 'l'
    board[0][2] = 'g'
    board[1][1] = 'c'
    board[2][1] = 'C'
    board[3][0] = 'G'
    board[3][1] = 'L'
    board[3][2] = 'E'
    board
  end

  def display_board(board)
    puts '後手:'
    puts '   | A | B | C |'

    board.each.with_index(1) do |row, i|
      print " #{i} |"
      row.each do |cell|
        print " #{cell} |"
      end
      print "\n"
    end
    puts '先手:'
  end

  def move_piece(board, from, to)
    pos_from = Position.new(from)
    pos_to = Position.new(to)

    return false if pos_to.out_of_board?

    board[pos_to.col][pos_to.row] = pos_from.animal
    board[pos_from.col][pos_from.row] = BLANK_CELL

    true
  end
end
