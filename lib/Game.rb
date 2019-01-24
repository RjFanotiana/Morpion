require_relative  'Player'
class Game
  
  #TO DO : la classe a plusieurs attr_accessor: le current_player (égal à un objet Player), le status (en cours, nul ou un objet Player s'il gagne), le Board et un array contenant les 2 joueurs.
  #def initialize
    #TO DO : créé 2 joueurs, créé un board, met le status à "on going", défini un current_player
  #end
  #def turn
    #TO DO : méthode faisant appelle aux méthodes des autres classes (notamment à l'instance de Board). Elle affiche le plateau, demande au joueur ce qu'il joue, vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas finie.
  #end
  #def new_round
    # TO DO : relance une partie en initialisant un nouveau board mais en gardant les mêmes joueurs.
  #end
  #def game_end
    # TO DO : permet l'affichage de fin de partie quand un vainqueur est détecté ou si il y a match nul
  #end    
  def playe
    tab = ["","","","","","","","",""]
    tabex = [" "," "," "," "," "," "," "," "," "]
    win=0

    puts "Joueur 1,choisiser votre signe (X/O)"
    s1=gets.chomp.to_s
    puts "Joueur 1 ,entrer votre pseudo :"
    j1=gets.chomp.to_s
    player1=Player.new(j1)
    player1.signe=s1

    if s1=="X" 
      s2="O"
    else
      s2="X"
    end
    puts "Joueur 2 vas Jouer #{s2} "
    puts "Joueur 2 ,entrer votre pseudo :"
    j2=gets.chomp.to_s
    player2=Player.new(j2)
    player2.signe=s2
    signe =player1.signe
    system ("clear")

    puts "##################-MORPION-##################"
    #DEBUT
    puts "    1    2    3"
    puts "A #{tabex[0..2].to_s}"
    puts "B #{tabex[3..5].to_s}"
    puts "C #{tabex[6..8].to_s}"
    puts
    puts player1.nom

    while ((tab[0]=="" || tab[1]=="" || tab[2]=="" || tab[3]=="" || tab[4]=="" || tab[5]=="" || tab[6]=="" || tab[7]=="" || tab[8]=="") && win==0)
      puts "Quelle case voulez vous remplir ?"
      choix = gets.chomp.to_s
      case choix
      when "A1"
        x="0".to_i
      when "A2"
        x="1".to_i
      when "A3"
        x="2".to_i
      when "B1"
        x="3".to_i
      when "B2"
        x="4".to_i
      when "B3"
        x="5".to_i
      when "C1"
        x="6".to_i
      when "C2"
        x="7".to_i
      when "C3"
        x="8".to_i
      end



      system("clear") if tab[x]==""
      while tab[x]!=""
        puts "Choisissez une autre case"
        choix = gets.chomp
        case choix
        when "A1"
          x="0".to_i
        when "A2"
          x="1".to_i
        when "A3"
          x="2".to_i
        when "B1"
          x="3".to_i
        when "B2"
          x="4".to_i
        when "B3"
          x="5".to_i
        when "C1"
          x="6".to_i
        when "C2"
          x="7".to_i
        when "C3"
          x="8".to_i
        end
      end
      tab[x]=signe
      tabex[x]=signe
      puts "##################-MORPION-##################"
      #TURN
      puts "    1    2    3"
      puts "A #{tabex[0..2].to_s}"
      puts "B #{tabex[3..5].to_s}"
      puts "C #{tabex[6..8].to_s}"
      if (signe=="X")
        puts"au tours de #{j2} de jouer"
        signe="O"
      else
        puts"au tours de #{j1} de jouer"
        signe="X"
      end


      if (tab[0]==tab[1] && tab[0]==tab[2] && tab[0]!="" || tab[3]==tab[4] && tab[3]==tab[5] && tab[3]!="" || tab[6]==tab[7] && tab[6]==tab[8] && tab[6]!="" || tab[0]==tab[3] && tab[0]==tab[6] && tab[0]!="" || tab[1]==tab[4] && tab[1]==tab[7] && tab[1]!="" || tab[2]==tab[5] && tab[2]==tab[8] && tab[2]!="" || tab[0]==tab[4] && tab[0]==tab[8] && tab[0]!="" || tab[2]==tab[4] && tab[2]==tab[6] && tab[2]!="")
        win=1
      end
    end
    #GAME_END
    if win==1
    if (signe=="X")
      puts "fin de partie, #{j2} a gagné"
    else
      puts "fin de partie, #{j1} a gagné"
    end
    else
    puts "fin de partie, match nul"
    end
  end
end
