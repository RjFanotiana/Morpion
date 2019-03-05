require_relative 'player'
require_relative 'board'
require_relative 'boardcase'

class Game
  attr_accessor :arr_player, :case_choice, :player_1, :player_2
  @@game_number = 0
  @@play1_wins = 0
  @@play2_wins = 0
  def initialize
    create_player
    @board = Board.new
    @statut_partie = "new"
    @winner = 0
    @show = Show.new
    turn
  end

 
  def create_player
      puts " nom du joueur 1 ?".colorize(:blue)
      player_name = gets.chomp.to_s.colorize(:blue)
      @player_1 = Player.new
      @player_1.create_player(player_name)
    
      puts " ", " nom du joueur 2 ?".colorize(:red)
      player_name = gets.chomp.to_s.colorize(:red)
      @player_2 = Player.new
      @player_2.create_player(player_name)

      @arr_player = [@player_1, @player_2]
  end



  def turn
    @@game_number += 1
    tour = 1
    @show.show_board(@board)
    puts " ", "La partie #{@@game_number} commence, youhou !!"
    while tour <= 9
      i = tour % 2
      puts " " 
      print "Partie #{@@game_number} - Tour ##{tour} : "
      @board.play_turn(arr_player[i])

     
      @show.show_board(@board)

     
      if @board.check_if_win == true
      
        i == 0 ? @@play1_wins =+1 : @@play2_wins += 1 
        i == 0 ? @winner = @player_1.name : @winner = player_2.name
        puts " ", "Partie terminée,  #{@winner} a gagnier", " "
        break
      elsif tour == 9 
        puts " ", " match nul !", " "
        break
      end

      tour += 1 
    end

    new_round 

  end



  def new_round
    answer = prompt_end_choice

    if answer == "OUI" 
      @board = Board.new
      @show = Show.new 
      turn
    else
      puts " ", "Merci"
      game_end
    end
  end


def game_end
 
  puts " jeu terminer  #{@@game_number} parties  score de :", " "
  print "#{@player_1.name} : #{@@play1_wins}".colorize(:blue)
  print " - "
  puts "#{@player_2.name} : #{@@play2_wins}".colorize(:red)
  puts " "
 exit! 
end

  def prompt_end_choice
    prompt = TTY::Prompt.new
    choices = ["OUI", "NON"]
    answer = prompt.select('Voulez-vous lancer une nouvelle partie ?', choices, help: '(Utilise les flèches pour choisir ta réponse et appuie sur Entrée)')
    return answer
  end


end
