require_relative 'piece'
require_relative 'tile'

class Board

  TOP_BORDER = '    A   B   C   D   E   F   G   H'

  def initialize
    #need to create an 8x8 array of tiles
    @board = []

    for x in 1..8
      row = []
      for y in 1..8
        row.push(::Tile.new({:position => [x,y]}))
      end
      @board.push(row)
    end
  end

  #this can probably be combined into the initial set board function to save iterations
  def set_board
    count = 1
    @board.each do |row|

      if count == 1
        back_row(row, ::Player::WHITE)
      elsif count == 2
        pawn_row(row, ::Player::WHITE)
      elsif count == 7
        pawn_row(row, ::Player::BLACK)
      elsif count == 8
        back_row(row, ::Player::BLACK)
      end

      count += 1
    end
  end

  #coordinates will come in array form e.g [1,1]
  def move_piece(origin_coordinate, dest_coordinate)
    origin_row = origin_coordinate[0] - 1
    origin_col = origin_coordinate[1] - 1
    dest_row   = dest_coordinate[0] - 1
    dest_col   = dest_coordinate[1] - 1

    origin_tile = @board[origin_row][origin_col]
    dest_tile   = @board[dest_row][dest_col]

    valid = false

    if origin_tile.occupied.present?
      if (dest_tile.occupied.present? && dest_tile.piece.color != origin_tile.piece.color) || !dest_tile.occupied.present?
        dest_tile.piece = origin_tile.piece
        origin_tile.piece = nil
        print_board
        valid = true
      else
        puts 'invalid move, try again'
      end
    else
      puts 'nothing here, try again'
    end
  end

  def print_board
    puts TOP_BORDER
    row_count = 1
    @board.each do |row|
      row_str = row_count.to_s + ' '
      row.each do |tile|
        if !tile.occupied.nil?
          row_str += '(' + tile.piece.piece_notation + ')'
        else
          row_str += '(  )'
        end
      end
      puts row_str
      row_count += 1
    end
  end

  private

  def back_row(row, color)
    row[0].piece = ::Piece.new({color: color, rank: ::Piece::ROOK})
    row[1].piece = ::Piece.new({color: color, rank: ::Piece::KNIGHT})
    row[2].piece = ::Piece.new({color: color, rank: ::Piece::BISHOP})
    row[3].piece = ::Piece.new({color: color, rank: ::Piece::QUEEN})
    row[4].piece = ::Piece.new({color: color, rank: ::Piece::KING})
    row[5].piece = ::Piece.new({color: color, rank: ::Piece::BISHOP})
    row[6].piece = ::Piece.new({color: color, rank: ::Piece::KNIGHT})
    row[7].piece = ::Piece.new({color: color, rank: ::Piece::ROOK})
  end

  def pawn_row(row, color)
    row.each do |tile|
      tile.piece = ::Piece.new({:color => ::Player::WHITE, :rank => ::Piece::PAWN})
    end
  end

end

