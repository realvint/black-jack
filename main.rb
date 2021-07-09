# frozen_string_literal: true
# start black-jack game
require_relative 'player'
require_relative 'dealer'
require_relative 'deck'
require_relative 'bank'
require_relative 'interface'
require_relative 'game'
require_relative 'card'

game = Game.new
game.start
