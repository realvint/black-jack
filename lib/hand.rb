class Hand
  attr_accessor :cards, :score

  def initialize
    @cards = []
    @score = 0
  end

  def count(cards)
    @cards = cards
    result = 0
    @cards.each do |card|
      result += 10 if card.value =~ /J|Q|K/
      result += 1 if (result + 11) > 21 && card.value =~ /A/
      result += 11 if (result + 11) <= 21 && card.value =~ /A/
      result += card.value.to_i if card.value =~ /1|2|3|4|5|6|7|8|9|10/
    end
    result
  end
end
