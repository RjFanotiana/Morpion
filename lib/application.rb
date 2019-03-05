
require_relative 'game'

class Application

  def initialize
    new_game
  end

  def new_game
    while true 
    system "clear"
    @game = Game.new
    end
  end

end
