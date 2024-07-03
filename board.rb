# frozen_string_literal: true

require_relative 'piece'

class Board
  def initialize
    @board = Array.new(4) { Array.new(3, ' ') }
    @board[0][0] = 'e'
    @board[0][1] = 'l'
    @board[0][2] = 'g'
    @board[1][1] = 'c'
    @board[2][1] = 'C'
    @board[3][0] = 'G'
    @board[3][1] = 'L'
    @board[3][2] = 'E'
  end

  def display
    puts '   | A | B | C |'

    @board.each.with_index(1) do |row, i|
      print " #{i} |"
      row.each do |cell|
        print " #{cell} |"
      end
      print "\n"
    end
  end

  def move_piece(from, to, player)
    pos_from = Piece.new(from)
    pos_to = Piece.new(to)

    return false if pos_to.out_of_board?
    return false unless valid_move?(pos_from, pos_to)

    add_piece_to_player(pos_to, player) unless @board[pos_to.col][pos_to.row].strip.empty?
    @board[pos_to.col][pos_to.row] = pos_from.animal
    @board[pos_from.col][pos_from.row] = ' '

    true
  end

  def finished?
    !(@board.flatten.include?('l') && @board.flatten.include?('L'))
  end

  private

  def valid_move?(from, to)
    piece = from.animal
    dx = to.col - from.col
    dy = to.row - from.row

    valid_moves = {
      'c' => [[1, 0]],                                                               # ひよこ
      'C' => [[-1, 0]],                                                              # ひよこ
      'g' => [[-1, 0], [1, 0], [0, -1], [0, 1]],                                     # きりん
      'G' => [[-1, 0], [1, 0], [0, -1], [0, 1]],                                     # きりん
      'e' => [[-1, -1], [-1, 1], [1, -1], [1, 1]],                                   # ぞう
      'E' => [[-1, -1], [-1, 1], [1, -1], [1, 1]],                                   # ぞう
      'l' => [[-1, 0], [1, 0], [0, -1], [0, 1], [-1, -1], [-1, 1], [1, -1], [1, 1]], # ライオン
      'L' => [[-1, 0], [1, 0], [0, -1], [0, 1], [-1, -1], [-1, 1], [1, -1], [1, 1]]  # ライオン
    }

    moves = valid_moves[piece] || []
    moves.include?([dx, dy])
  end

  def add_piece_to_player(to, player)
    player.pieces << @board[to.col][to.row].swapcase
  end
end
