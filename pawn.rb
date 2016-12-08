require_relative 'piece'

class Pawn < Piece
	def initialize(params)
		@moved = false
		super(params)
 	end

	def validate_move(origin_tile, destination_tile)

		if @color == ::Player::BLACK
			puts 'piece color: black'
			puts "piece rank: #{@rank}"
			puts "piece moved: #{@moved}"
			puts "origin_tile y position: #{origin_tile.y_position}"
			puts "destination y position: #{destination_tile.y_position}"
			puts "origin_tile x position: #{origin_tile.x_position}"
			puts "destination x position: #{destination_tile.x_position}"
			if (origin_tile.y_position == destination_tile.y_position + 1) || (origin_tile.y_position == destination_tile.y_position + 2 && @moved == false)
				return true
			#	puts 'valid_move is true'
			else
				return false
			end
		elsif @color == ::Player::WHITE
			puts 'piece color: white'
			puts "origin_tile y position: #{origin_tile.y_position}"
			puts "destination y position: #{destination_tile.y_position}"
			puts "origin_tile x position: #{origin_tile.x_position}"
			puts "destination x position: #{destination_tile.x_position}"
	    if (origin_tile.y_position == destination_tile.y_position - 1) || (origin_tile.y_position == destination_tile.y_position - 2 && @moved == false)
				return true
			else
				return false
			end
		else
			return false
		end
	end
end
