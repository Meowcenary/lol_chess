#This sets the load path to make it
#easier to include files in rspec tests
lib = File.expand_path("../../", __FILE__)
$:.unshift(lib)

require 'board.rb'
require 'piece.rb'
require 'player.rb'
require 'tile.rb'
