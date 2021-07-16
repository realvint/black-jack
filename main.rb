# frozen_string_literal: true

require_relative 'player'
require_relative 'dealer'
require_relative 'deck'
require_relative 'interface'

class Main
  include Interface

  def new_game
    input_name
    name = gets.chomp
    alert if name.empty?
    @player = Player.new(name)
    greeting
    @dealer = Dealer.new('Dealer')
    @deck = Deck.new
    start
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
      out_of_money
      exit
    end
  end

  def choose_turn
    choice_menu
    @input = input_choice
    action(@input)
    raise choose_turn unless [0, 1, 2, 3].include?(@input)
  end

  def action(input)
    exit if input.zero?
    get_turn('Dealer') if input == 3
    open_cards if input == 2
    if input == 1
      third_card(@player.name) if @player.hand.cards.size < 3
      max_cards
      dealer_turn
    end
  end

  def open_cards
    show_player_info
    show_dealer_info
    if @dealer.hand.score == @player.hand.score
      draw
      @dealer.bank += 10
      @player.bank += 10
    elsif (@player.hand.score > 21) || (@dealer.hand.score > @player.hand.score && @dealer.hand.score <= 21)
      @dealer.bank += 20
      you_lost
    else
      @player.bank += 20
      you_win
    end
    show_play_again_menu
    choice = input_choice
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
      added_card
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
    dealer_ready_open
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

m = Main.new
m.new_game


