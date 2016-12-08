class Piece
  attr_reader :color, :rank

  def initialize(params)
    @color = params.delete(:color)
    @rank  = params.delete(:rank)
  end

  def move (origin_tile, destination_tile)
    #this will need to be checked for every piece...
    if origin_tile.occupied?
      if (destination_tile.occupied? && destination_tile.piece.color != origin_tile.piece.color) || !destination_tile.occupied?
        if validate_move(origin_tile, destination_tile)
          destination_tile.piece = origin_tile.piece
          origin_tile.piece = nil
          valid_move = true
        end
      end
    end
  end

end
