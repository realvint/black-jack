require_relative 'card'

class Deck
  attr_accessor :cards, :random_card

  CARD = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze
  SUIT = %w[♠ ♥ ♣ ♦].freeze

  def initialize
    @cards = []
  end

  def create_card
    @value = CARD.sample
    @suit = SUIT.sample
    @random_card = Card.new(@value, @suit)
    # cards << random_card
  end

  def make_third_card
    @third_card = create_card.random_card
  end
end