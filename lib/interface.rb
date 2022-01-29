# frozen_string_literal: true
class Interface

  def input_name
    puts 'Введите ваше имя:'
  end

  def alert
    puts 'Имя не может быть пустым'
    exit
  end

  def greeting(player)
    puts
    puts "Приветствую тебя #{player} в игре BlackJack"
  end

  def out_of_money
    puts 'У вас недостаточно денег для продолжения игры. Вы самое слабое звено!'
  end

  def choice_menu(cards, score, player_bank, dealer_bank)
    puts
    puts "Ваши карты: #{cards}. Ваш счёт: #{score}. Ваш банк: $#{player_bank}"
    puts "Карты дилера [**, **]. Счёт дилера [**]. У дилера в банке: $#{dealer_bank}"
    puts
    puts 'Введите 1, чтобы взять дополнительную карту'
    puts 'Введите 2, чтобы открыть карты'
    puts 'Введите 3, чтобы пропустить ход'
    puts 'Введите 0, чтобы закончить игру'
  end

  def added_card
    puts
    puts 'Вы взяли дополнительную карту, ход переходит к дилеру'
  end

  def show_player_info(name, cards, score)
    puts "#{name} ваши карты: #{cards}, сумма очков: #{score}"
  end

  def show_dealer_info(cards, score)
    puts "У дилера #{cards}, сумма очков: #{score}"
  end

  def dealer_ready_open
    puts 'Дилер пропускает ход, делайте ваш выбор'
  end

  def show_play_again_menu(bank)
    puts
    puts "У вас в банке: $#{bank}"
    puts
    puts 'Введите 1, чтобы сыграть еще раз'
    puts 'Введите 0, чтобы закончить игру'
  end

  def you_win(bank)
    puts
    puts "Вы победили и получили $20 в свой банк, теперь у вас есть: $#{bank}!"
  end

  def you_lost(bank)
    puts
    puts "Вы проиграли! У вас осталось $#{bank} в банке."
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
