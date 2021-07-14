# frozen_string_literal: true
class Interface
  def input_name
    puts 'Введите ваше имя:'
  end

  def alert
    puts 'Имя не может быть пустым'
    new_game
  end

  def greeting
    puts
    puts "Приветствую тебя #{@player.name} в игре BlackJack"
  end

  def out_of_money
    puts 'У вас недостаточно денег для продолжения игры. Вы самое слабое звено!'
  end

  def choice_menu
    puts
    puts "Ваши карты: #{@player.hand}. Вас счёт: #{@player.score}. Ваш банк: $#{@player.bank}"
    puts "Карты дилера [**, **]. Счёт дилера [**]. У дилера в банке: $#{@dealer.bank}"
    puts
    puts 'Введите 1, чтобы взять дополнительную карту'
    puts 'Введите 2, чтобы открыть карты'
    puts 'Введите 3, чтобы пропустить ход'
    puts 'Введите 0, чтобы закончить игру'
  end

  def input_choice
    gets.chomp.to_i
  end

  def added_card
    puts
    puts 'Вы взяли дополнительную карту, ход переходит к дилеру'
  end

  def show_player_info
    puts "#{@player.name} ваши карты: #{@player.hand}, сумма очков: #{@player.score}"
  end

  def show_dealer_info
    puts "У дилера #{@dealer.hand}, сумма очков: #{@dealer.score}"
  end

  def dealer_ready_open
    puts 'Дилер пропускает ход, делайте ваш выбор'
  end

  def show_play_again_menu
    puts
    puts "У вас в банке: $#{@player.bank}"
    puts
    puts 'Введите 1, чтобы сыграть еще раз'
    puts 'Введите 0, чтобы закончить игру'
  end

  def you_win
    puts
    puts "Вы победили и получили $20 в свой банк, теперь у вас есть: $#{@player.bank}!"
  end

  def you_lost
    puts
    puts "Вы проиграли! У вас осталось $#{@player.bank} в банке."
  end

  def max_cards
    puts
    puts 'Достигнуто максимальное количество карт! Ход переходит дилеру'
  end

  def draw
    puts
    puts 'Ничья! Деньги из банка игры возвращаются своим владельцам!'
  end
end