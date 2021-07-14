require_relative 'interface'

class Player
  attr_accessor :name, :bank, :hand, :score

  def initialize(name)
    @name = name
    @bank = 100
    @hand = []
    @score = 0
  end

  def refresh
    @hand = []
    @score = 0
  end
end