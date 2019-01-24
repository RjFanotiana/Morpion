require_relative  'Game'
class Application
  def initialize
    @controller =  Game.new
  end 
  def perform
    # TO DO : méthode qui initialise le jeu puis contient des boucles while pour faire tourner le jeu tant que la partie n'est pas terminée.
    # 
    puts "BIENVENUE DANS TIC-TAC-TOE"
    while true

      #on affiche le menu
      puts "Vous voulez faire quoi ?"
      puts "1. faire une nouvelle parti "
      puts "2. veux quitter le jeux"
      params = gets.chomp.to_i #on attend le choix de l'utilisateur

      case params #en fonction du choix
      when 1
        system ("clear")
        puts "##################-MORPION-##################"
        @controller.playe
        
      when 2
        puts "À bientôt !"
        break #ce "break" permet de sortir de la boucle while. C'est même la seule façon d'en sortir.
      else
        puts "Ce choix n'existe pas, merci de ressayer" #si l'utilisateur saisit une entrée non prévue, il retourne au début du "while true". C'est pour ça que la boucle est infinie: potentiellement, il peut se gourer jusqu'à la fin des temps :)
      end
    end

  end
end
