class Tile
  attr_reader   :position
  attr_accessor :piece

  def initialize(params)
    #e.g [1, 1]
    @position = params.delete(:position)
    @piece    = params.delete(:piece)
  end

  def occupied?
    !@piece.nil?
  end
end

