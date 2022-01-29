# frozen_string_literal: true

require_relative 'lib/player'
require_relative 'lib/dealer'
require_relative 'lib/deck'
require_relative 'lib/interface'

class Main

  def initialize(interface)
    @interface = interface
    @interface.input_name
    name = gets.chomp
    @interface.alert if name.empty?
    @player = Player.new(name)
    @interface.greeting(@player.name)
    @dealer = Dealer.new('Dealer')
    @deck = Deck.new
  end

  def start
    refresh
    make_bet(@player)
    make_bet(@dealer)
    2.times do
      @deck.create_card
      @dealer.hand.cards << @deck.random_card
      @deck.create_card
      @player.hand.cards << @deck.random_card
    end
    @dealer.hand.score = @dealer.hand.count(@dealer.hand.cards)
    @player.hand.score = @player.hand.count(@player.hand.cards)
    choose_turn
  end

  def make_bet (user)
    if user.bank > 10
      user.bank -= 10
    else
      @interface.out_of_money
      exit
    end
  end

  def choose_turn
    @interface.choice_menu({cards: @player.hand.cards,
                            score: @player.hand.score,
                            player_bank: @player.bank,
                            dealer_bank: @dealer.bank
                           })
    input = gets.chomp.to_i
    action(input)
    raise choose_turn unless [0, 1, 2, 3].include?(input)
  end

  def action(input)
    exit if input.zero?
    get_turn('Dealer') if input == 3
    open_cards if input == 2
    if input == 1
      third_card(@player.name) if @player.hand.cards.size < 3
      @interface.max_cards
      dealer_turn
    end
  end

  def open_cards
    @interface.show_player_info(@player.name, @player.hand.cards, @player.hand.score)
    @interface.show_dealer_info(@dealer.hand.cards, @dealer.hand.score)
    if @dealer.hand.score == @player.hand.score
      @interface.draw
      @dealer.bank += 10
      @player.bank += 10
    elsif (@player.hand.score > 21) || (@dealer.hand.score > @player.hand.score && @dealer.hand.score <= 21)
      @dealer.bank += 20
      @interface.you_lost(@player.bank)
    else
      @player.bank += 20
      @interface.you_win(@player.bank)
    end
    @interface.show_play_again_menu(@player.bank)
    choice = gets.chomp.to_i
    if choice == 1
      start
    else
      exit
    end
  end

  def third_card(name)
    if name == @player.name
      @deck.create_card
      @player.hand.cards << @deck.random_card
      @player.hand.score = @player.hand.count(@player.hand.cards)
      @interface.added_card
      dealer_turn
    else
      @deck.create_card
      @dealer.hand.cards << @deck.random_card
      @dealer.hand.score = @dealer.hand.count(@dealer.hand.cards)

      choose_turn
    end
  end

  def get_turn(name)
    if name.nil?
      choose_turn
    else
      dealer_turn
    end
  end
end

def dealer_turn
  if @dealer.hand.score >= 17
    @interface.dealer_ready_open
    get_turn(nil)
  else
    @dealer.hand.score < 17 && @dealer.hand.cards.size < 3
    third_card('Dealer')
  end
end

def refresh
  @player.hand.score = 0
  @dealer.hand.score = 0
  @dealer.hand.cards = []
  @player.hand.cards = []
end

interface = Interface.new
Main.new(interface).start
