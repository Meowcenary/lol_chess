require_relative 'board'
require_relative 'player'

p1 = ::Player.new({:color => ::Player::WHITE})
p2 = ::Player.new({:color => ::Player::BLACK})

board = ::Board.new
board.set_board
board.print_board
board.move_piece([1,1], [3,1])
board.move_piece([3,1], [1,2])
