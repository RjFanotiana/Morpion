require_relative 'boardcase'
require_relative 'game'
require_relative 'show'

class Board
  attr_accessor :boardcase_array, :coups, :no_choice_arr, :a1, :a2, :a3, :b1, :b2, :b3, :c1, :c2, :c3, :no_choice_arr, :choice_arr, :choices
  def initialize
    
    @a1 = BoardCase.new("A1")
    @a2 = BoardCase.new("A2")
    @a3 = BoardCase.new("A3")
    @b1 = BoardCase.new("B1")
    @b2 = BoardCase.new("B2")
    @b3 = BoardCase.new("B3")
    @c1 = BoardCase.new("C1")
    @c2 = BoardCase.new("C2")
    @c3 = BoardCase.new("C3")
    @boardcase_array = [a1, a2, a3, b1, b2, b3, c1, c2, c3]
    @no_choice_arr = Array.new
    @choice_arr = Array.new
  end

  def play_turn(player)
    @choice_arr = @boardcase_array - @no_choice_arr

   
    puts " ", "C'est à #{player.name} de jouer", " "
    puts "#{player.name}: dans quelle case veux-tu jouer?", " "
    
   
    answer = prompt_boardcase_choice
    @boardcase_array.each do |el|
      if el.name == answer
        el.valeur = player.player_symbol
        @no_choice_arr << el
      end
    end
   
    check_if_win
  end

  def check_if_win
    
    if (@a1.valeur == (@a2.valeur) && @a1.valeur == (@a3.valeur) && (@a1.valeur) != " ") || (@b1.valeur == (@b2.valeur) && @b1.valeur == (@b3.valeur) && (@b1.valeur) != " ") || (@c1.valeur == (@c2.valeur) && @c1.valeur == (@c3.valeur) && (@c1.valeur) != " ")
      return true
   
    elsif (@a1.valeur == (@b1.valeur) && @a1.valeur == (@c1.valeur) && (@a1.valeur) != " ") || (@a2.valeur == (@b2.valeur) && @a2.valeur == (@c2.valeur) && (@a2.valeur) != " ") || (@a3.valeur == (@b3.valeur) && @a3.valeur == (@c3.valeur) && (@a3.valeur) != " ")
      return true
    
    elsif (@a1.valeur == (@b2.valeur) && @a1.valeur == (@c3.valeur) && (@a1.valeur) != " ") || (@c1.valeur == (@b2.valeur) && @c1.valeur == (@a3.valeur) && (@c1.valeur) != " ")
      return true
    end
  end

  def prompt_boardcase_choice
    
    prompt = TTY::Prompt.new
   
    choices = Array.new
    
    @choice_arr.each { |el| choices << el.name }
    answer = prompt.select('Choisis la case dans la liste ci-dessous?', choices, help: '(Utilise les flèches pour choisir ta réponse et appuie sur Entrée)', per_page: 9)
    return answer
  end

end
