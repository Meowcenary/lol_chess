require_relative 'board'
require_relative 'player'

p1 = ::Player.new({:color => ::Player::WHITE})
p2 = ::Player.new({:color => ::Player::BLACK})

board = ::Board.new
board.set_board
board.print_board

#should go in those order
#valid, valid, fail, fail, valid, valid, fail, fail

#testing white pawn movements
# board.move([2, 7], [3, 7]) #moving a pawn forward once
# board.move([2, 8], [4, 8]) #moving a pawn on it's first move two squares
# board.move([2, 6], [5, 6]) #cant move a pawn forward three squares
# board.move([3, 7], [2, 7]) #cant move a pawn backwards

#testing black pawn movements
board.move([7, 1], [6, 1]) #moving a pawn forward once
# puts "\n\n\n///////////////////////////////////////\n\n\n"
 board.move([7, 2], [5, 2]) #moving a pawn on it's first move two squares
# puts "\n\n\n///////////////////////////////////////\n\n\n"
 board.move([7, 3], [4, 3]) #cant move a pawn forward three squares
# puts "\n\n\n///////////////////////////////////////\n\n\n"
 board.move([6, 1], [7, 1]) #cant move a pawn backward
# puts "\n\n\n///////////////////////////////////////\n\n\n"