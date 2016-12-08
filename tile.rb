class Tile
  attr_reader   :position
  attr_accessor :piece

  def initialize(params)
    #e.g [1, 1] , this would make more sense as a point object
    @position = params.delete(:position)
    @piece    = params.delete(:piece)
  end

  def occupied?
    !@piece.nil?
  end

  def y_position
    #puts "y positions: #{@position[0]}"
    @position[0]
  end

  def x_position
    #puts "x positions: #{@position[1]}"
    @position[1]
  end

end
