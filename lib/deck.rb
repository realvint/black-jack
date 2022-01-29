require_relative 'card'

class Deck
  attr_accessor :random_card

  def initialize
    deck = []
    Card::SUITS.each do |suit|
      Card::CARDS.each { |value| deck << Card.new(value, suit) }
    end
    @deck = deck.shuffle
  end

  def create_card
    @random_card = @deck.sample
    @deck.delete(random_card)
  end

  def make_third_card
    @third_card = create_card.random_card
  end
end
