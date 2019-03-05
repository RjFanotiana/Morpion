require_relative 'board'
require_relative 'game'

class Show

 
  def show_board(board)
    
    system "clear"
    
    puts "
         A     B     C
            |     |     
      1  #{board.a1.valeur}  |  #{board.b1.valeur}  |  #{board.c1.valeur}  
       _____|_____|_____
            |     |     
      2  #{board.a2.valeur}  |  #{board.b2.valeur}  |  #{board.c2.valeur}  
       _____|_____|_____
            |     |     
      3  #{board.a3.valeur}  |  #{board.b3.valeur}  |  #{board.c3.valeur}  
            |     |     "
  end

end
