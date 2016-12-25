class Piece
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

  def piece_notation
    color + rank
  end
end

