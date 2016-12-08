require_relative 'piece'
require_relative 'tile'
require_relative 'rank'
require_relative 'pawn'

class Board
  TOP_BORDER = '    A   B   C   D   E   F   G   H'
  SEPARATOR  = "\n\n\n/////////////////////////////////\n\n\n"

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

  def set_board
    count = 1
    @board.each do |row|
      if count == 1
        row[0].piece = ::Piece.new({:color => ::Player::WHITE, :rank => ::Rank::ROOK})
        row[1].piece = ::Piece.new({:color => ::Player::WHITE, :rank => ::Rank::KNIGHT})
        row[2].piece = ::Piece.new({:color => ::Player::WHITE, :rank => ::Rank::BISHOP})
        row[3].piece = ::Piece.new({:color => ::Player::WHITE, :rank => ::Rank::QUEEN})
        row[4].piece = ::Piece.new({:color => ::Player::WHITE, :rank => ::Rank::KING})
        row[5].piece = ::Piece.new({:color => ::Player::WHITE, :rank => ::Rank::BISHOP})
        row[6].piece = ::Piece.new({:color => ::Player::WHITE, :rank => ::Rank::KNIGHT})
        row[7].piece = ::Piece.new({:color => ::Player::WHITE, :rank => ::Rank::ROOK})
      elsif count == 2
        row.each do |tile|
          tile.piece = ::Pawn.new({:color => ::Player::WHITE, :rank => ::Rank::PAWN})
        end
      elsif count == 7
        row.each do |tile|
          tile.piece = ::Pawn.new({:color => ::Player::BLACK, :rank => ::Rank::PAWN})
        end
      elsif count == 8
        row[0].piece = ::Piece.new({:color => ::Player::BLACK, :rank => ::Rank::ROOK})
        row[1].piece = ::Piece.new({:color => ::Player::BLACK, :rank => ::Rank::KNIGHT})
        row[2].piece = ::Piece.new({:color => ::Player::BLACK, :rank => ::Rank::BISHOP})
        row[3].piece = ::Piece.new({:color => ::Player::BLACK, :rank => ::Rank::QUEEN})
        row[4].piece = ::Piece.new({:color => ::Player::BLACK, :rank => ::Rank::KING})
        row[5].piece = ::Piece.new({:color => ::Player::BLACK, :rank => ::Rank::BISHOP})
        row[6].piece = ::Piece.new({:color => ::Player::BLACK, :rank => ::Rank::KNIGHT})
        row[7].piece = ::Piece.new({:color => ::Player::BLACK, :rank => ::Rank::ROOK})
      end
      count += 1
    end
  end

  #coordinates will come in array form e.g [1,1]
  def move(origin_coordinate, dest_coordinate)
    origin_row  = origin_coordinate[0] - 1
    origin_col  = origin_coordinate[1] - 1

    dest_row    = dest_coordinate[0]   - 1
    dest_col    = dest_coordinate[1]   - 1

    origin_tile = @board[origin_row][origin_col]
    dest_tile   = @board[dest_row][dest_col]
    piece       = origin_tile.piece

    if piece.move(origin_tile, dest_tile)
      print_board
    else
      puts "Invalid move, try again"
    end
  end

  def print_board
    puts TOP_BORDER
    row_count = 1
    @board.each do |row|
      row_str = row_count.to_s + ' '
      row.each do |tile|
        if tile.occupied?
          row_str += '(' + tile.piece.color + tile.piece.rank + ')'
        else
          row_str += '(  )'
        end
      end
      puts row_str
      row_count += 1
    end
    puts SEPARATOR
  end

end
