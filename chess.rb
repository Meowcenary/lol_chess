class Tile
  attr_reader   :position
  attr_accessor :piece

  def initialize(params)
    #e.g [A, 1]
    @position = params.delete(:position)
    #literally a piece object that is placed here
    @piece    = params.delete(:piece)
  end

  def occupied?
    !@piece.nil?
  end
end

class Piece
  #piece rank constants
  PAWN   = 'p'
  ROOK   = 'r'
  KNIGHT = 'n'
  BISHOP = 'b'
  QUEEN  = 'q'
  KING   = 'k'

  attr_reader :color, :rank

  def initialize(params)
    @color = params.delete(:color)
    @rank  = params.delete(:rank)
  end
end

class Player
  #color constants
  WHITE = 'w'
  BLACK = 'b'

  attr_reader :color, :pieces

  def initialize(params)
    @color  = params.delete(:color)
    @pieces = gen_pieces(@color)

    #@pieces.each { |piece| puts piece.color + piece.rank }
  end

  private
  #generate the initial set of pieces for a player
  def gen_pieces(color)
    pieces = Array.new(8, ::Piece.new({:color => color, :rank => ::Piece::PAWN}))
    pieces.push(::Piece.new({:color => color, :rank => ::Piece::ROOK}))
    pieces.push(::Piece.new({:color => color, :rank => ::Piece::ROOK}))
    pieces.push(::Piece.new({:color => color, :rank => ::Piece::KNIGHT}))
    pieces.push(::Piece.new({:color => color, :rank => ::Piece::KNIGHT}))
    pieces.push(::Piece.new({:color => color, :rank => ::Piece::BISHOP}))
    pieces.push(::Piece.new({:color => color, :rank => ::Piece::BISHOP}))
    pieces.push(::Piece.new({:color => color, :rank => ::Piece::QUEEN}))
    pieces.push(::Piece.new({:color => color, :rank => ::Piece::KING}))
  end
end

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
    #set pieces .......................:::::::;;;;;;;
    #it might make sense to write  little function to print an
    #array in a nice looking format
    #board.each { |row| row.each { |tile| print tile.position, tile.occupied?, "\n" } }
  end

  def set_board
    count = 1
    @board.each do |row|
      if count == 1
        row[0].piece = ::Piece.new({:color => ::Player::WHITE, :rank => ::Piece::ROOK})
        row[1].piece = ::Piece.new({:color => ::Player::WHITE, :rank => ::Piece::KNIGHT})
        row[2].piece = ::Piece.new({:color => ::Player::WHITE, :rank => ::Piece::BISHOP})
        row[3].piece = ::Piece.new({:color => ::Player::WHITE, :rank => ::Piece::QUEEN})
        row[4].piece = ::Piece.new({:color => ::Player::WHITE, :rank => ::Piece::KING})
        row[5].piece = ::Piece.new({:color => ::Player::WHITE, :rank => ::Piece::BISHOP})
        row[6].piece = ::Piece.new({:color => ::Player::WHITE, :rank => ::Piece::KNIGHT})
        row[7].piece = ::Piece.new({:color => ::Player::WHITE, :rank => ::Piece::ROOK})
      elsif count == 2
        row.each do |tile|
          tile.piece = ::Piece.new({:color => ::Player::WHITE, :rank => ::Piece::PAWN})
        end
      elsif count == 7
        row.each do |tile|
          tile.piece = ::Piece.new({:color => ::Player::BLACK, :rank => ::Piece::PAWN})
        end
      elsif count == 8
        row[0].piece = ::Piece.new({:color => ::Player::BLACK, :rank => ::Piece::ROOK})
        row[1].piece = ::Piece.new({:color => ::Player::BLACK, :rank => ::Piece::KNIGHT})
        row[2].piece = ::Piece.new({:color => ::Player::BLACK, :rank => ::Piece::BISHOP})
        row[3].piece = ::Piece.new({:color => ::Player::BLACK, :rank => ::Piece::QUEEN})
        row[4].piece = ::Piece.new({:color => ::Player::BLACK, :rank => ::Piece::KING})
        row[5].piece = ::Piece.new({:color => ::Player::BLACK, :rank => ::Piece::BISHOP})
        row[6].piece = ::Piece.new({:color => ::Player::BLACK, :rank => ::Piece::KNIGHT})
        row[7].piece = ::Piece.new({:color => ::Player::BLACK, :rank => ::Piece::ROOK})
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

    #puts origin_row.to_s + origin_col.to_s, dest_row.to_s + dest_col.to_s
    origin_tile = @board[origin_row][origin_col]
    dest_tile   = @board[dest_row][dest_col]

    valid = false

#    while !valid
      if origin_tile.occupied?
        if (dest_tile.occupied? && dest_tile.piece.color != origin_tile.piece.color) || !dest_tile.occupied?
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
    # end
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
  end
end

p1 = ::Player.new({:color => ::Player::WHITE})
p2 = ::Player.new({:color => ::Player::BLACK})

board = ::Board.new
board.set_board
board.print_board
board.move_piece([1,1], [3,1])
board.move_piece([3,1], [1,2])
