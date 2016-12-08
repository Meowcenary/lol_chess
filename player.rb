class Player
  WHITE = 'w'
  BLACK = 'b'

  attr_reader :color

  def initialize(params)
    @color  = params.delete(:color)
  end

  private

end
